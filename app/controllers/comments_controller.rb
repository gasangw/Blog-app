class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(post_id: @post.id, user_id: current_user.id, Text: comment_params)
    @comment.post_id = @post.id

    if @comment.save
      redirect_to user_post_path(current_user, @post.id)
    else
      render :new, alert: 'Error occured!'
    end
  end

  def remove_comment
    @post = Post.includes(:comments).find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    @post.comment_counter -= 1
    @post.save

    respond_to do |format|
      format.html { redirect_to(user_posts_url) }
    end
  end

  def comment_params
    params.require(:comment).permit(:text)[:text]
  end
  private :comment_params
end
