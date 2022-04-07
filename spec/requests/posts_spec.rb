require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    before(:each) do
      get user_posts_path(user_id: 3)
    end

    it 'handles GET requests' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders a correct template' do
      expect(response).to render_template(:index)
    end

    it 'renders content correctly' do
      expect(response.body).to include('')
    end
  end

  describe 'GET #show' do
    before(:each) do
      get user_post_path(user_id: 3, id: 1)
    end

    it 'handles GET requests' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders a correct template' do
      expect(response).to render_template(:show)
    end

    it 'renders content correctly' do
      expect(response.body).to include('')
    end
  end
end
