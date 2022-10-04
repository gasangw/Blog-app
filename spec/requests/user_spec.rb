require 'rails_helper'

RSpec.describe 'Users', type: %w[request feature] do
  before :each do
    @user = User.new(
      Name: 'Thomas',
      Photo: 'http://great.com/org.pjg',
      Bio: 'Full-stack developer',
      PostsCounter: 0
    )
    @user.save
  end

  it 'renders index template' do
    get '/user/'
    expect(response.status).to eq(200)
    expect(response).to render_template('index')
  end

  it 'renders the show template' do
    get "/user/#{@user.id}"
    expect(response.status).to eq(200)
    expect(response).to render_template('show')
  end

  it 'renders template of index with the right text' do
    visit '/user/'
    expect(page).to have_text('Here is a list of all user')
  end

  it 'renders the show template with the texts that it contains' do
    visit "/show/#{@user.id}"
    expect(page).to have_text('Here is a list of all user')
  end
end
