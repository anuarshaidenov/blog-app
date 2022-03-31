require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    before(:each) do
      get '/users'
    end

    it "renders a correct template" do
      expect(response).to render_template(:index)
    end
  end
end
