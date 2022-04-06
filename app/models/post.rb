class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  def recent_comments
    comments.order(created_at: :asc).limit(5)
  end

  after_save :increment_post_counter

  private

  def increment_post_counter
    author.increment!(:posts_counter)
  end
end
