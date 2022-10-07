class ApplicationController < ActionController::Base
    def available_user
        User.find(params[:user_id])
    end
end
