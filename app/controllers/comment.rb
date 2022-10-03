class CommentsController < ApplicationController
    def new_comment
        @comment = Comment.new
    end
end