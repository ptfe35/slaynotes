class CreatePageTags < ActiveRecord::Migration[5.2]
  def change
    create_table :page_tags do |t|
      t.integer :page_id, null: false
      t.string :name, null: false
      t.timestamps
    end
  end
end
