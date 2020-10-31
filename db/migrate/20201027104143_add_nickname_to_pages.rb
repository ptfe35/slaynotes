class AddNicknameToPages < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :nickname, :string
  end
end
