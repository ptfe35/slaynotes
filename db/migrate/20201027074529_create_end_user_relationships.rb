class CreateEndUserRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :end_user_relationships do |t|
      t.integer :end_user_id, null: false, foreign_key: true
      t.integer :follow_id, null: false, foreign_key: { to_table: :users }
      t.timestamps
      t.index [:end_user_id, :follow_id], unique: true
    end
  end
end
