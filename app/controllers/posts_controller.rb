class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id].to_i)
    @post = @user.posts
  end

  def show
    @post = Post.joins(:user).where(user: { id: params[:user_id] }).find(params[:id])
    @comments = @post.comments
  end
end
