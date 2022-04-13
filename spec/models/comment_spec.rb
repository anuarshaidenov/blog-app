require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment model' do
    first_user = User.create!(name: 'Tom', photo: 'photo.jpg', bio: 'Teacher from Mexico.', email: 'tomss@example.com', password: 'password')
    first_post = Post.create!(author_id: first_user.id, title: 'Hello', text: 'This is my first post')
    comment = Comment.new(post_id: first_post.id, author_id: first_user.id, text: 'Hi Tom!')

    before { comment.save! }

    it 'comment must be present' do
      expect(first_post.comments.length).to eq 1
    end

    it 'comment must have a correct text' do
      expect(first_post.comments.first.text).to eq 'Hi Tom!'
    end
  end
end
