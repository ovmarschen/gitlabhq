class Projects::RunnersController < Projects::ApplicationController
  before_action :ci_project
  before_action :set_runner, only: [:edit, :update, :destroy, :pause, :resume, :show]
  before_action :authorize_admin_project!

  layout 'project_settings'

  def index
    @runners = @ci_project.runners.order('id DESC')
    @specific_runners =
      Ci::Runner.specific.includes(:runner_projects).
      where(Ci::RunnerProject.table_name => { project_id: current_user.authorized_projects } ).
      where.not(id: @runners).order("#{Ci::Runner.table_name}.id DESC").page(params[:page]).per(20)
    @shared_runners = Ci::Runner.shared.active
    @shared_runners_count = @shared_runners.count(:all)
  end

  def edit
  end

  def update
    if @runner.update_attributes(runner_params)
      redirect_to runner_path(@runner), notice: 'Runner was successfully updated.'
    else
      redirect_to runner_path(@runner), alert: 'Runner was not updated.'
    end
  end

  def destroy
    if @runner.only_for?(@ci_project)
      @runner.destroy
    end

    redirect_to runners_path(@project)
  end

  def resume
    if @runner.update_attributes(active: true)
      redirect_to runner_path(@runner), notice: 'Runner was successfully updated.'
    else
      redirect_to runner_path(@runner), alert: 'Runner was not updated.'
    end
  end

  def pause
    if @runner.update_attributes(active: false)
      redirect_to runner_path(@runner), notice: 'Runner was successfully updated.'
    else
      redirect_to runner_path(@runner), alert: 'Runner was not updated.'
    end
  end

  def show
  end

  protected

  def set_runner
    @runner ||= @ci_project.runners.find(params[:id])
  end

  def runner_params
    params.require(:runner).permit(:description, :tag_list, :contacted_at, :active)
  end
end
