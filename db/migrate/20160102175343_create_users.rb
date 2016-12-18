class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.date :birthday
      t.string :gender
      t.text :bio
      t.string :location
      t.boolean :is_admin

      t.timestamps null: false
    end
  end
end
