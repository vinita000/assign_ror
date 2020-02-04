class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        view_all_stories_path
    end
end
