require_relative "base_service"

module Files
  class CreateService < Files::BaseService
    def commit
      repository.commit_file(current_user, @file_path, @file_content, @commit_message, @target_branch, false)
    end

    def validate
      super

      file_name = File.basename(@file_path)

      unless file_name =~ Gitlab::Regex.file_name_regex
        raise_error(
          'Your changes could not be committed, because the file name ' +
          Gitlab::Regex.file_name_regex_message
        )
      end

      unless project.empty_repo?
        @file_path.slice!(0) if @file_path.start_with?('/')

        blob = repository.blob_at_branch(@current_branch, @file_path)

        if blob
          raise_error("Your changes could not be committed because a file with the same name already exists")
        end
      end
    end
  end
end
