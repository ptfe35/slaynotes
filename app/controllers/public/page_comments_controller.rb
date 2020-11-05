class Public::PageCommentsController < ApplicationController

  def create
    @page = Page.find(params[:page_id])
    comment = current_end_user.page_comments.new(page_comment_params)
    comment.page_id = @page.id
    if comment.save
      comment.page.create_notification_comment!(current_end_user, comment.id) # 通知の作成
    end
  end

  def destroy
    @page = Page.find(params[:page_id])
    page_comment = PageComment.find_by(id: params[:id], page_id: params[:page_id])
    page_comment.update(comment: "ー　このコメントは投稿者により削除されました。　ー")
  end

  private

  def page_comment_params
    params.require(:page_comment).permit(:comment)
  end

end
