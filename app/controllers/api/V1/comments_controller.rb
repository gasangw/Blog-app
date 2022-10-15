class Api::V1::CommentsController < ApplicationController
  def index
    comment = Comment.find(params[:id])
    render json: comment
  end

  def new
    @comment = Comment.new
  end

  def create
    comment = Comment.new(comment_params)
    render json: comment, status: 'Success' if comment.save
  end

  def comment_params
    params.require(:comment).permit(:Text, :user_id, :post_id)
  end
end
