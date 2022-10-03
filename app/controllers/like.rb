class LikesController < ApplicationController
    def new_like
        @like = Like.new
    end
end