class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.integer :chapter_id, null: false
      t.string :name, null: false
      t.boolean :is_public, null: false
      t.integer :creater_id, null: false
      t.timestamps
    end
  end
end
