class RenameCreaterIdColumnToCreatorId < ActiveRecord::Migration[5.2]
  def change
    rename_column :notes, :creater_id, :creator_id
    rename_column :pages, :creater_id, :creator_id
  end
end
