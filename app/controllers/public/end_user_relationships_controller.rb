class Public::EndUserRelationshipsController < ApplicationController

  before_action :set_end_user

  def create
    following = current_end_user.follow(@end_user)
    if following.save
      @end_user.create_notification_follow!(current_end_user) # 通知の作成
      flash[:notice] = 'ユーザーをフォローしました'
      redirect_back(fallback_location: end_user_path(current_end_user))
    else
      flash.now[:error] = 'ユーザーのフォローに失敗しました'
      redirect_back(fallback_location: end_user_path(current_end_user))
    end
  end

  def destroy
    following = current_end_user.unfollow(@end_user)
    if following.destroy
      flash[:notice] = 'ユーザーのフォローを解除しました'
      redirect_back(fallback_location: end_user_path(current_end_user))
    else
      flash.now[:error] = 'ユーザーのフォロー解除に失敗しました'
      redirect_back(fallback_location: end_user_path(current_end_user))
    end
  end

  private

  def set_end_user
    @end_user = EndUser.find(params[:follow_id])
  end

end
