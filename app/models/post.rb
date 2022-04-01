class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  # A method that updates the posts counter for a user.
  def update_posts_counter
    author.increment!(:posts_counter)
  end

  # A method which returns the 5 most recent comments for a given post.
  def latest_comments
    comments.limit(5).order(created_at: :desc)
  end
end
