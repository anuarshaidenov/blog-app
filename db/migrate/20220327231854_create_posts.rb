class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    unless table_exists? :posts
      create_table :posts do |t|
        t.string :title
        t.text :text
        t.integer :comments_counter
        t.integer :likes_counter
        t.timestamps
      end
    end
  end
end