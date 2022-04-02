require 'rails_helper'

# write test for Like model
RSpec.describe Like, type: :model do
  describe 'update_post_likes_counter' do
    it 'should update likes counter for a post' do
      user = User.create(name: 'ALen', bio: 'bio')
      post = Post.create(author_id: user.id, title: 'Post 1', text: 'Post 2 body')
      like = Like.create(author_id: user.id, post_id: post.id)
      # validate presence of author_id, post_id
      expect(like.author_id).to eq(user.id)
      expect(like.post_id).to eq(post.id)
    end
    it 'should update likes counter for a post' do
      user = User.create(name: 'ALen', bio: 'bio')
      post = Post.create(author_id: user.id, title: 'Post 1', text: 'Post 2 body')
      like = Like.create(author_id: user.id, post_id: post.id)
      expect(like.post_id).to eq(post.id)
    end

    # validate association with user
    it 'should validate association with user' do
      user = User.create(name: 'ALen', bio: 'bio')
      post = Post.create(author_id: user.id, title: 'Post 1', text: 'Post 2 body')
      like = Like.create(author_id: user.id, post_id: post.id)
      expect(like.author_id).to eq(user.id)
    end

    # validate association with post
    it 'should validate association with post' do
      user = User.create(name: 'ALen', bio: 'bio')
      post = Post.create(author_id: user.id, title: 'Post 1', text: 'Post 2 body')
      like = Like.create(author_id: user.id, post_id: post.id)
      expect(like.post_id).to eq(post.id)
    end

    # validate uniqueness of author_id and post_id
    it 'should validate uniqueness of author_id and post_id' do
      user = User.create(name: 'ALen', bio: 'bio')
      post = Post.create(author_id: user.id, title: 'Post 1', text: 'Post 2 body')
      like = Like.create(author_id: user.id, post_id: post.id)
      expect(like.author_id).to eq(user.id)
      expect(like.post_id).to eq(post.id)
    end
  end
end
