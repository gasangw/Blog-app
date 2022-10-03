class UsersController < ApplicationController
    def new_user
        @user = User.new
    end
end