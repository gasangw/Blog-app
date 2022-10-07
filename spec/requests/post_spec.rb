require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Posts', type: %w[request] do
  before :each do
    @post = Post.new(
      Title: 'Great Efforts yield Great Results',
      Text: 'Its always hard at first put with time you again',
      CommentsCounter: 0,
      LikesCounter: 0
    )
    @post.save
  end

  describe 'GET /index' do
    it 'renders the index template' do
      get '/post/'
      expect(response.status).to eq(200)
      expect(response).to render_template('index')
      expect(response.body).to include('Here is a list of all user')
    end
  end

  describe 'GET /show' do
    it 'renders the show template' do
      get "/post/#{@post.id}"
      expect(response.status).to eq(200)
      expect(response).to render_template('show')
    end
  end

  describe 'VISIT/ index' do
    it 'renders the index template with the right text' do
      visit '/post/'
      expect(page).to have_text('Here is a list of posts for a given user')
    end
  end

  describe 'VISIT/ show' do
    it 'renders the show template with the text' do
      visit "/show/#{@post.id}"
      expect(page).to have_text('Here is a list of posts for a given user')
    end
  end
end
