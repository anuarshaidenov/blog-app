require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    before(:each) do
      get user_posts_path(user_id: 1)
    end

    it 'handles GET requests' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders a correct template' do
      expect(response).to render_template(:index)
    end

    it 'renders content correctly' do
      expect(response.body).to include('<h1>Here you will find all posts</h1>')
    end
  end

  describe 'GET #show' do
    before(:each) do
      get user_post_path(user_id: 1, id: 1)
    end

    it 'handles GET requests' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders a correct template' do
      expect(response).to render_template(:show)
    end

    it 'renders content correctly' do
      expect(response.body).to include('<h1>Here you will find a single post</h1>')
    end
  end
end
