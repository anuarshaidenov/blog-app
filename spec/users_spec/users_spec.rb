require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET index' do
    before(:each) { get '/users' }

    it 'it should render a template' do
      expect(response).to render_template('users/index')
    end

    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'should test heading text inside template' do
      expect(response.body).to include('Users Index Page')
    end
  end

  describe 'GET show' do
    before(:each) { get '/users/1' }

    it 'Should be 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render a template' do
      expect(response).to render_template('users/show')
    end

    it 'should test heading text inside template' do
      expect(response.body).to include('Show Users Page')
    end
  end
end
