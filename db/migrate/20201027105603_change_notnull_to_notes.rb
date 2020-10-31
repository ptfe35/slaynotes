class ChangeNotnullToNotes < ActiveRecord::Migration[5.2]
  def change
    change_column_null :notes, :number, false
  end
end
