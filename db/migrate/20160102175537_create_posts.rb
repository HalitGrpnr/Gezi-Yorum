class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.float :latitude
      t.float :longitude
      t.string :address
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
