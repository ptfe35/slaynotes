class Public::NotesController < ApplicationController
  protect_from_forgery except: [:sort]

  def show
    @note = Note.find(params[:id])
    @end_user = EndUser.find(@note.end_user_id)
    @notes = @end_user.notes.rank(:row_order)
    @note_new = Note.new

    page_tag_id = params[:page_tag_id] # クリックしたタグのIDを取得する。
    if page_tag_id.present?
      @page_tag = PageTag.find(params[:page_tag_id]) # クリックしたタグを取得する。
      @pages = @page_tag.pages.where(note_id: @note.id).rank(:row_order) # クリックしたタグに紐づくページのみを抽出する。
    else
      @pages = Page.where(note_id: @note.id).rank(:row_order)
    end
  end

  def create
    @note = Note.new(note_params)
    @note.end_user_id = current_end_user.id
    @note.creator_id = current_end_user.id
    @note.is_public = 1
    @note.number = 1
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
    params.require(:note).permit(:name, :end_user_id, :text, :is_public, :image, :number, :creator_id, :row_order_position)
  end
end
