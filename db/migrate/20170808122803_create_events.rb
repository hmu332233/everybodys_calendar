class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :start
      t.string :end
      t.string :url

      t.timestamps null: false
    end
  end
end
