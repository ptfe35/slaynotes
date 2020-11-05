class Public::NotesController < ApplicationController

  def index
    @note = Note.new
    @notes = Note.where(end_user_id: current_end_user)
  end

  def show
    @note = Note.find(params[:id])
    page_tag_id = params[:page_tag_id] # クリックしたタグのIDを取得する。
    if page_tag_id.present?
      @page_tag = PageTag.find(params[:page_tag_id]) # クリックしたタグを取得する。
      @pages = @page_tag.pages.where(note_id: @note.id) # クリックしたタグに紐づくページのみを抽出する。
    else
      @pages = Page.where(note_id: @note.id)
    end
  end

  def create
    @note = Note.new(note_params)
    @note.end_user_id = current_end_user.id
    @note.creator_id = current_end_user.id
    @note.is_public = 1
    @note.number = 1
    @note.row_order = @note.id
    @note.save
    redirect_to notes_path
  end

  def sort
    note = Note.find(params[:note_id])
    note.update(note_params)
    render body: nil 
  end

  private

  def note_params
    params.require(:note).permit(:name, :text, :is_public, :image, :number, :creater_id, :row_order_position)
  end

end
