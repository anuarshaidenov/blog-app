require 'rails_helper'

# write test for Like model here
RSpec.describe Comment, type: :model do
  it 'is invalid without a body' do
    expect(Comment.new(text: nil)).to be_invalid
  end

  # test user association with new comment
  it 'belongs to a user' do
    user = User.create(name: 'ALen', bio: 'bio')
    comment = Comment.create(text: 'text', author: user)
    expect(comment.author).to eq(user)
  end

  # test post association with new comment
  it 'belongs to a post' do
    post = Post.create(title: 'title', author: User.create(name: 'ALen', bio: 'bio'))
    comment = Comment.create(text: 'text', post:)
    expect(comment.post).to eq(post)
  end
end
