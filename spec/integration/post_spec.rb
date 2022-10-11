require 'rails_helper'

RSpec.describe 'post index/#html', type: :feature do
    before :each do
        @tom = User.create(Name: 'Peter', Photo: 'https://www.google.com/images', Bio: 'Software Engineer', PostsCounter: 2 )
        @tom_post = Post.create(user: @tom, Title: 'Senior Developer', Text: 'I love learning', LikesCounter: 2,
                CommentsCounter: 1 )
        Comment.create(Text: 'I love what you are becoming', user:@tom, post:@tom_post)

    end

    before(:example) { visit user_posts_path(@tom)}

    describe 'index page' do 
        it 'I can see the users profile picture' do
            expect(page).to have_content(@post)
        end

        it 'i can see the users username' do
            expect(page).to have_content('Peter')
        end
        
        it 'I can see the number of posts the user has written' do
            expect(page).to have_content(2)
        end

        it 'I can see a posts title.' do 
            expect(page).to have_content('I love learning')
        end

        it 'I can see some of the posts body.' do 
            expect(page).to have_content('I love learning')
        end

        it 'I can see the first comments on a post.' do 
            expect(page).to have_content('I love what you are becoming')
        end 

        it 'I can see how many comments a post has' do 
            expect(page).to have_content('Comments: 2')
        end

        it 'I can see how many likes a post has.' do
            expect(page).to have_content('Likes: 2')
        end

        it 'I can see a section for pagination if there are more posts than fit on the view.' do
            expect(page).to have_content('Pagination')
        end

        # it 'When I click on a post, it redirects me to that posts show page.' do 
        #     click_link(@tom_post.Title)
        #     expect(page).to have_current_path(user_posts_path(@tom))
        # end
        
    end

   
end

 