require 'rails_helper'

RSpec.describe Post, type: :model do
    before(:each) do
        @post = Post.create(
            user: @user, 
            Title: 'Hello', 
            Text: 'This is my first post', 
            CommentsCounter: 0,
            LikesCounter: 0  
        )
    end

    context 'invalid inputs' do
        it 'is inavlid when Title is blank' do
            @post.Title = ''
            expect(@post).to_not be_valid
        end

        it 'is invalid when :title length > 250' do
            @post.Title = 'g' * 251
            expect(@post).to_not be_valid
        end

        it 'comment counter should be greater than or equal to zero' do
            @post.CommentsCounter = 0
            expect(@post).to_not be_valid
        end

        it 'like counter should be greater than or equal to zero' do
            @post.LikesCounter = 0
            expect(@post).to_not be_valid
        end
          
    end
end

