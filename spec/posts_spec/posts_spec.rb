require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET post' do
    before(:each) { get '/users/:user_id/posts' }

    it 'should render a template' do
      expect(response).to render_template('posts/index')
    end

    it 'has a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'should test heading text inside template' do
      expect(response.body).to include('Posts Index Page')
    end
  end

  describe 'GET show' do
    before(:each) { get '/users/:user_id/posts/11' }

    it 'Should be 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'should render a template' do
      expect(response).to render_template('posts/show')
    end

    it 'should test heading text inside template' do
      expect(response.body).to include('Show Post Pag')
    end
  end
end
