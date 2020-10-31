class Public::EndUsersController < ApplicationController

  def show
    @end_user = EndUser.find(params[:id])
    @notes = @end_user.notes.rank(:row_order)
  end

  def sort
    note = Note.find(params[:note_id])
    note.update(note_params)
    render body: nil
  end

  private

  def note_params
    params.require(:note).permit(:name, :is_public, :image_id, :number, :creater_id, :row_order_position)
  end

end