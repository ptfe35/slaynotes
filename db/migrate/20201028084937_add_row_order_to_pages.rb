class AddRowOrderToPages < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :row_order, :integer
  end
end
