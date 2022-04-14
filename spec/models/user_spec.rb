require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User model' do
    user = User.new(name: 'Anuar', photo: 'photo_link', bio: 'wag1', email: 'anuar@test.me', password: 'password')

    before { user.save }

    it 'name must not be blank' do
      user.name = nil
      expect(user).to_not be_valid
      user.name = 'Anuar'
    end

    it 'post counter must be an integer' do
      user.posts_counter = 'hi'
      expect(user).to_not be_valid
      user.posts_counter = 0
    end

    it 'should have 0 posts' do
      expect(user.recent_posts.length).to eq 0
    end
  end
end
