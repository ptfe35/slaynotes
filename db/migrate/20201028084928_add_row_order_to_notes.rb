class AddRowOrderToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :row_order, :integer
  end
end
