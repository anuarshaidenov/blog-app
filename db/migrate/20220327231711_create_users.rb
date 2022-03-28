class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    unless table_exists? :users
      create_table :users do |t|
        t.string :name
        t.string :photo
        t.text :bio
        t.integer :posts_counter, null: false, default: 0
        t.timestamps
      end
    end
  end
end