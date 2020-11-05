class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :visiter_id
      t.integer :visited_id
      t.integer :note_id
      t.integer :page_id
      t.integer :page_comment_id
      t.string :action
      t.boolean :is_checked, default: false, null: false

      t.timestamps
    end
  end
end
