class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id].to_i)
    @post = @user.posts.includes(:comments)
    render json: @post
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user,
            @comments = @post.comments
    render json: @post
  end

  def create
    @post_new = current_user.posts.new(post_params[:id])
    respond_to do |format|
      format.html do
        if @post_new.save
          redirect_to "/users/#{@post_new.user_id}/posts/", message: 'Success'
        else
          render :new, alert: 'Error occured please check again!'
        end
      end
    end
  end

  def post_params
    params.require(:post).permit(:Title, :Text)
  end
  private :post_params
end
