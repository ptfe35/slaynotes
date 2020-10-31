class ChangeNotnullToPages < ActiveRecord::Migration[5.2]
  def change
    change_column_null :pages, :number, false
  end
end
