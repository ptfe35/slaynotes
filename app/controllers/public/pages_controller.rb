class Public::PagesController < ApplicationController

  def new
    @note = Note.new
    @page = Page.new
  end

  def create

    @note = Note.new(note_params)
    @note.end_user_id = current_end_user.id
    @note.creater_id = current_end_user.id
    @note.is_public = 1
    @note.number = 1

    @page = Page.new(page_params)
    @page.chapter_id = @chapter.id
    @page.creater_id = current_end_user.id
    @page.is_public = 1
    @page.number = 1

    @note.save
    @page.save
    redirect_to end_user_path(current_end_user)
  end

  private

  def note_params
    params.require(:note).permit(:name, :is_public, :image_id, :number, :creater_id)
  end

  def page_params
    params.require(:page).permit(:name, :is_public, :image_id, :number, :creater_id)
  end

end
