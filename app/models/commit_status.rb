class CommitStatus < ActiveRecord::Base
  self.table_name = 'ci_builds'

  belongs_to :commit, class_name: 'Ci::Commit'
  belongs_to :user

  validates :commit, presence: true
  validates :status, inclusion: { in: %w(pending running failed success canceled) }

  validates_presence_of :name

  alias_attribute :author, :user

  scope :running, -> { where(status: 'running') }
  scope :pending, -> { where(status: 'pending') }
  scope :success, -> { where(status: 'success') }
  scope :failed, -> { where(status: 'failed')  }
  scope :running_or_pending, -> { where(status:[:running, :pending]) }
  scope :latest, -> { where(id: unscope(:select).select('max(id)').group(:name, :ref)) }
  scope :ordered, -> { order(:ref, :stage_idx, :name) }
  scope :for_ref, ->(ref) { where(ref: ref) }
  scope :running_or_pending, -> { where(status: [:running, :pending]) }

  state_machine :status, initial: :pending do
    event :run do
      transition pending: :running
    end

    event :drop do
      transition running: :failed
    end

    event :success do
      transition [:pending, :running] => :success
    end

    event :cancel do
      transition [:pending, :running] => :canceled
    end

    after_transition pending: :running do |build, transition|
      build.update_attributes started_at: Time.now
    end

    after_transition any => [:success, :failed, :canceled] do |build, transition|
      build.update_attributes finished_at: Time.now
    end

    state :pending, value: 'pending'
    state :running, value: 'running'
    state :failed, value: 'failed'
    state :success, value: 'success'
    state :canceled, value: 'canceled'
  end

  delegate :sha, :short_sha, :gl_project,
           to: :commit, prefix: false

  # TODO: this should be removed with all references
  def before_sha
    Gitlab::Git::BLANK_SHA
  end

  def started?
    !pending? && !canceled? && started_at
  end

  def active?
    running? || pending?
  end

  def complete?
    canceled? || success? || failed?
  end

  def duration
    if started_at && finished_at
      finished_at - started_at
    elsif started_at
      Time.now - started_at
    end
  end

  def cancel_url
    nil
  end

  def retry_url
    nil
  end
end
