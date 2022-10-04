require 'rails_helper'

RSpec.describe 'Users', type: %w[request] do
  before :each do
    @user = User.new(
      Name: 'Thomas',
      Photo: 'http://great.com/org.pjg',
      Bio: 'Full-stack developer',
      PostsCounter: 0
    )
    @user.save
  end

  describe 'GET /index' do
    it 'renders index template' do
      get '/user/'
      expect(response.status).to eq(200)
      expect(response).to render_template('index')
    end
  end

  describe 'GET /show' do
    it 'renders the show template' do
      get "/user/#{@user.id}"
      expect(response.status).to eq(200)
      expect(response).to render_template('show')
      expect(response.body).to include('Here is a list of all user')
    end
  end

  describe 'VISIT/ show' do
    it 'renders template of index with the right text' do
      visit '/user/'
      expect(page).to have_text('Here is a list of all user')
    end
  end

  describe 'VISIT /show' do
    it 'renders the show template with the texts that it contains' do
      visit "/show/#{@user.id}"
      expect(page).to have_text('Here is a list of all user')
    end
  end
end
