class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :content
      t.string :start
      t.string :end
      t.string :url
      
      t.integer :calendar_id

      t.timestamps null: false
    end
  end
end
