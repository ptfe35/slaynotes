class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.integer :end_user_id, null: false
      t.string :name, null: false
      t.boolean :is_public, null: false
      t.integer :creater_id, null: false
      t.string :image_id
      t.timestamps
    end
  end
end
