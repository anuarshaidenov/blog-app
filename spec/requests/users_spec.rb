require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    before(:each) do
      get '/users'
    end

    it "handles GET requests" do
      expect(response).to have_http_status(:ok)
    end

    it "renders a correct template" do
      expect(response).to render_template(:index)
    end

    it "renders content correctly" do
      expect(response.body).to include('<h1>Here you will find the list of users</h1>')
    end
  end
end
