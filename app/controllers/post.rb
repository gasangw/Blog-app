class PostsController < ApplicationController
  def index
    @user = User.includes(posts: [:comments]).find(params[:user_id].to_i)
  end

  def show; end
end
