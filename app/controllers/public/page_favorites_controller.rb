class Public::PageFavoritesController < ApplicationController
  def create
    @page = Page.find(params[:page_id])
    favorite = current_end_user.page_favorites.new(page_id: @page.id)
    favorite.save
    @page.create_notification_like!(current_end_user) # 通知の作成
  end

  def destroy
    @page = Page.find(params[:page_id])
    favorite = current_end_user.page_favorites.find_by(page_id: @page.id)
    favorite.destroy
  end
end
