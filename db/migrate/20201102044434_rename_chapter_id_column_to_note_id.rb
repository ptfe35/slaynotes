class RenameChapterIdColumnToNoteId < ActiveRecord::Migration[5.2]
  def change
    rename_column :pages, :chapter_id, :note_id
  end
end
