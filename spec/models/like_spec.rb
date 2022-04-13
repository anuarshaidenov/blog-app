require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Like model' do
    first_user = User.create!(name: 'Tom', photo: 'photo.jpg', bio: 'Teacher from Mexico.', email: 'to@example.com', password: 'password')
    first_post = Post.create!(author_id: first_user.id, title: 'Hello', text: 'This is my first post')
    like = Like.new(post_id: first_post.id, author_id: first_user.id)

    before { like.save! }

    it 'like must be present' do
      expect(first_post.likes.length).to eq 1
    end
  end
end
