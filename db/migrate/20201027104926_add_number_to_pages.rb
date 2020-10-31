class AddNumberToPages < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :number, :integer
  end
end
