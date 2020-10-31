class CreatePageImages < ActiveRecord::Migration[5.2]
  def change
    create_table :page_images do |t|
      t.integer :page_id, null: false
      t.string :image_id, null: false
      t.timestamps
    end
  end
end
