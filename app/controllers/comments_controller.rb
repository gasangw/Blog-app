class CommentsController < ApplicationController

    def new
        @comment = Comment.new
    end

    def create
        @post = Post.find(params[:post_id])
        @comment = available_user.comments.new(
            Text: comment_params,
            user_id: current_user.id,
            post_id: @post.id
        )

        @comment.post_id = @post.id
        if @comment.after_save
            redirect_to "/users/#{@post.user_id}/posts/#{@post.id}", message: 'comment successfully created!'
        else
            render :new, alert: 'Error occured!'
        end
    end
end