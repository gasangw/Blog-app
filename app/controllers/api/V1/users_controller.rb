class Api.V1::UsersController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def show
    @user = User.find(params[:id])
    render json: @user, status: :ok
  end
end
