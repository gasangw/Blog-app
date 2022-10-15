class Api::V1::PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
    render json: @posts, status: ok
  end

  def show
    @post = Post.find(params[:id])
    render json: @post, status: ok
  end
end
