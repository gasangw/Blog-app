class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id].to_i)  
  end
end
