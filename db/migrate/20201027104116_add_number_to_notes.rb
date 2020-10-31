class AddNumberToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :number, :integer
  end
end
