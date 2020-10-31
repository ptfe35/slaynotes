class CreateEndUserTags < ActiveRecord::Migration[5.2]
  def change
    create_table :end_user_tags do |t|
      t.integer :end_user_id, null: false
      t.string :name, null: false
      t.timestamps
    end
  end
end
