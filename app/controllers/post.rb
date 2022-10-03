class PostsController < ApplicationController
    def new_post
        @post = Post.new
    end
end
