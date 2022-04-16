require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Like model' do
    before(:each) do
      first_user = User.create!(name: 'Tom', photo: 'photo.jpg', bio: 'Teacher from Mexico.', email: 'to@example.com',
                                password: 'password')
      first_post = Post.create!(author_id: first_user.id, title: 'Hello', text: 'This is my first post')
      Like.create!(post_id: first_post.id, author_id: first_user.id)
    end

    it 'like must be present' do
      expect(Like.all.length).to eq 1
    end

    it 'like must have a correct author' do
      expect(Like.first.author.name).to eq 'Tom'
    end
  end
end
