require 'rails_helper'

RSpec.describe 'user/#index', type: :feature do
  before :each do
    visit users_path
    @users = User.all
  end
  describe 'index page' do
    it 'It shows the names of all users' do
       @users.each { |user| expect(page).to have_content(user.Name) }
    end

    it 'It shows the profile picture of each users' do
       @users.each { |user| expect(page).to have_content(user.Photo) }
    end

    it 'It shows the number of posts of each user has written' do
       @users.each { |user| expect(page).to have_content(user.PostsCounter) }
    end

    it 'it directs me to the users page when i click on the user' do
      @users.each { |user| expect(user).to link_to user_path(user.id) }
    end
  end

  context 'users show/#html' do
    before :each do
        @tom = User.create(Name: 'Tom', Photo: 'https://www.google.com/images', Bio: 'Software Engineer', PostsCounter: 2 )

        @tom_post = Post.create([
            { user: @tom, Title: 'Senior Developer', Text: 'I love learning', LikesCounter: 2,
                CommentsCounter: 1 },
            { user: @tom, Title: 'Businessman', Text: 'I love doing business', LikesCounter: 0,
                CommentsCounter: 3 },
            { user: @tom, Title: 'Frontend Developer', Text: 'I love working on projects', LikesCounter: 10,
                CommentsCounter: 7 },
            { user: @tom, Title: 'Web Developer', Text: 'learning', LikesCounter: 8,
                CommentsCounter: 1 }
        ])
    end

    before(:example) { visit user_path(@tom) }
    it "displays a user's name" do
      expect(page).to have_content('Tom')
    end

    it 'it displays the user profile picture' do
        expect(page).to have_css("img[src*='https://www.google.com/images']")
    end
    
    it 'I can see the number of posts the user has written' do
        expect(page).to have_content('Number of posts: 6')
    end

    it 'display the users bio' do 
        expect(page).to have_content('Software Engineer')
    end

    it 'displays the first three posts' do
      expect(page).to_not have_content('I love learning')
      expect(page).to have_content('I love doing business')
      expect(page).to have_content('I love working on projects')
      expect(page).to have_content('learning')
    end
    
    it 'I can see a button that lets me view all of a users posts.' do
        expect(page).to have_content('See all posts')
    end

    it 'When I click to see all posts, it redirects me to the users posts index page.' do
       click_link('See all posts')
       expect(page).to have_current_path(user_posts_path(@tom))
    end
  end  

end
