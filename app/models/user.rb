class User < ApplicationRecord
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  has_many :posts, foreign_key: 'author_id'

  # Name must not be blank.
  validates :name, presence: { message: 'Name can\'t be blank' }
  # PostsCounter must be an integer greater than or equal to zero.
  validates_numericality_of :posts_counter, only_integer: true, greater_than_or_equal: 0
  # A method that returns the 3 most recent posts for a given user.
  def latest_posts
    posts.limit(3).order(created_at: :desc)
  end
end
