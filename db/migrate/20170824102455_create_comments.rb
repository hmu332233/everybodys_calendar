class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.string :writer
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
