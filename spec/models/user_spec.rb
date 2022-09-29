require 'rails_helper'

RSpec.describe User, type: :model do
    before(:each) do
        @user = User.create(
            Name: 'Thomas', 
            Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', 
            Bio: 'Teacher from Mexico.',
            PostsCounter: 2     
        )
    end

    context 'with invalid values' do
        it 'title should be present' do
        @user.Name = nil
        expect(@user).to_not be_valid
        end
        
        it 'PostCounter must be an integer greater than or equal to zero' do
        @user.PostsCounter = nil
        expect(@user).to_not be_valid
        end

    end

end
