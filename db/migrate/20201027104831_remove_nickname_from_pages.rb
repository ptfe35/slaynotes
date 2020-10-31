class RemoveNicknameFromPages < ActiveRecord::Migration[5.2]
  def change
    remove_column :pages, :nickname, :integer
  end
end
