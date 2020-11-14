class Public::OrganizesController < ApplicationController
  def index
    @notes = current_end_user.notes.rank(:row_order)
  end

  def show
    @note = Note.find(params[:id])
    @pages = Page.where(note_id: @note.id).rank(:row_order)
  end
end
