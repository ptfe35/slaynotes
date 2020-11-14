class Public::PagesController < ApplicationController
  protect_from_forgery except: [:sort]

  def show
    @page = Page.find(params[:id])
    @page_comment = PageComment.new
  end

  def new
    @page = Page.new
    @notes = Note.where(end_user_id: current_end_user)
  end

  def create
    @page = Page.new(page_params)
    @page.creator_id = current_end_user.id
    # フォームから送られてきたタグネームをsplit(",")で区切りを付けて、pageとは別にtagに保存
    tag_list = params[:page][:tag_name].split(nil)

    @page.is_public = 1
    @page.number = 1

    @page.save
    @page.save_tags(tag_list) # page.rbで定義したメソッド
    redirect_to note_path(@page.note_id)
  end

  def edit
    @page = Page.find(params[:id])
    @notes = Note.where(end_user_id: current_end_user)
    @tag_list = @page.page_tags.pluck(:name).join(nil)
  end

  def update
    @page = Page.find(params[:id])
    # フォームから送られてきたタグネームをsplit(",")で区切りを付けて、pageとは別にtagに保存
    tag_list = params[:page][:tag_name].split(nil)
    if @page.update(page_params)
      @page.save_tags(tag_list) # page.rbで定義したメソッド
      flash[:notice] = '編集が完了しました。'
      redirect_to note_path(@page.note_id)
    else
      @notes = Note.where(end_user_id: current_end_user)
      render 'edit'
    end
  end

  def sort
    page = Page.find(params[:page_id])
    page.update(page_params)
    render body: nil
  end

  private

  def page_params
    params.require(:page).permit(:name, :is_public, :note_id, :text, :number, :creator_id, :row_order_position)
  end

  def page_tag_params
    params.require(:page_tag).permit(:name)
  end
end
