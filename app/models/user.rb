class User < ApplicationRecord
  has_many :comments, foreign_key: 'user_id'
  has_many :likes, foreign_key: 'user_id'
  has_many :posts, foreign_key: 'user_id'

  # A method that returns the 3 most recent posts for a given user.
  def latest_posts
    posts.limit(3).order(created_at: :desc)
  end
end
