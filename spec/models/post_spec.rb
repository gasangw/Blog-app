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

    context 'methods the check for comments and like increament' do
        it 'calling the post_counter increases the postcounter by 1' do
            expect(@post.PostsCounter).to eq(1)
            @post.post_counter
            expect(@post.PostsCounter).to eq(2)
        end

        it 'should display the recent comments' do
            
        end
    end

    context 'Associations' do
        it { should have_many(:comments) }
        it { should have_many(:likes) }
        it { should belong_to(:user) }
    end
end

