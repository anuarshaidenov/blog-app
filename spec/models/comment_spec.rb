require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment model' do
    first_user = User.create(name: 'Tom', photo: 'photo.jpg', bio: 'Teacher from Mexico.')
    first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
    comment = Comment.new(post: first_post, author: first_user, text: 'Hi Tom!')

    before { comment.save }

    it 'comment must be present' do
      expect(first_post.comments.length).to eq 1
    end

    it 'comment must have a correct text' do
      expect(first_post.comments.first.text).to eq 'Hi Tom!'
    end
  end
end
