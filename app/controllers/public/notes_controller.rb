class Public::NotesController < ApplicationController

  def index
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.end_user_id = current_end_user.id
    @note.creater_id = current_end_user.id
    @note.is_public = 1
    @note.number = 1
    @note.row_order = @note.id
    @note.save
    redirect_to end_user_path(current_end_user)
  end

  def sort
    note = Note.find(params[:note_id])
    note.update(note_params)
    render body: nil 
  end

  private

  def note_params
    params.require(:note).permit(:name, :text, :is_public, :image_id, :number, :creater_id, :row_order_position)
  end

end
