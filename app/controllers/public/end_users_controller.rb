class Public::EndUsersController < ApplicationController

  def show
    @end_user = EndUser.find(params[:id])
    @notes = @end_user.notes.rank(:row_order)
    @note = Note.new
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    if @end_user.update(end_user_params)
      flash[:notice] = '会員情報を変更しました。'
      redirect_to end_user_path(current_end_user)
    else
      flash.now[:error] = '入力内容に誤りがあります。'
      render 'edit'
    end
  end

  def following
    @end_user = EndUser.find(params[:id])
    @end_users = @end_user.followings
  end

  def followers
    @end_user = EndUser.find(params[:id])
    @end_users = @end_user.followers
  end

  def sort
    note = Note.find(params[:id])
    note.update(note_params)
    render body: nil
  end

  private

  def end_user_params
    params.require(:end_user).permit(:name, :introduction, :email)
  end

  def note_params
    params.require(:note).permit(:name, :is_public, :image, :number, :creater_id, :row_order_position)
  end
end
