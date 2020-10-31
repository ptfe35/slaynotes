class CreatePageFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :page_favorites do |t|
      t.integer :page_id, null: false
      t.integer :end_user_id, null: false
      t.timestamps
    end
  end
end
