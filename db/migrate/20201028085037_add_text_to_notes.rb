class AddTextToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :text, :text
  end
end
