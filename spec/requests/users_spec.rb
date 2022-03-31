require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:each) do
      get users_path
    end

    it 'handles GET requests' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders a correct template' do
      expect(response).to render_template(:index)
    end

    it 'renders content correctly' do
      expect(response.body).to include('<h1>Here you will find the list of users</h1>')
    end
  end

  describe 'GET #show' do
    before(:each) do
      get user_path(id: 1)
    end

    it 'handles GET requests' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders a correct template' do
      expect(response).to render_template(:show)
    end

    it 'renders content correctly' do
      expect(response.body).to include('<h1>Here you will see the information about a single user.</h1>')
    end
  end
end
