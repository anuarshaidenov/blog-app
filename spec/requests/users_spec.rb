require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:each) do
      first_user = User.create!(name: 'Tom', photo: 'photo.jpg', bio: 'Teacher from Mexico.', email: 'to@example.com',
                                password: 'password')
      Post.create!(author_id: first_user.id, title: 'Hello', text: 'This is my first post')
      get users_path
    end

    it 'handles GET requests' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders a correct template' do
      expect(response).to render_template(:index)
    end

    it 'renders content correctly' do
      expect(response.body).to include('Tom')
    end
  end

  describe 'GET #show' do
    before(:each) do
      first_user = User.create!(name: 'Tom', photo: 'photo.jpg', bio: 'Teacher from Mexico.', email: 'to@example.com',
                                password: 'password')
      Post.create!(author_id: first_user.id, title: 'Hello', text: 'This is my first post')
      get user_path(id: first_user.id)
    end

    it 'handles GET requests' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders a correct template' do
      expect(response).to render_template(:show)
    end

    it 'renders content correctly' do
      expect(response.body).to include('Tom')
    end
  end
end
