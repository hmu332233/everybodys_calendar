class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      
      t.string :title
      t.string :writer
      t.string :content
      
      t.integer :user_id
      t.integer :calendar_id
      
      t.timestamps null: false
    end
  end
end
