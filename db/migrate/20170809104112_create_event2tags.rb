class CreateEvent2tags < ActiveRecord::Migration
  def change
    create_table :event2tags do |t|

      t.integer :event_id
      t.integer :hash_tag_id
      
      t.timestamps null: false
    end
  end
end
