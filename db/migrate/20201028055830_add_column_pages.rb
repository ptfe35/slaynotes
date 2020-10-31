class AddColumnPages < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :text, :text
  end
end
