class Public::NotificationsController < ApplicationController

  def index
    @notifications = current_end_user.passive_notifications
    @notifications.where(is_checked: false).each do |notification|
      notification.update_attributes(is_checked: true)
    end
  end

  def destroy_all
    # 通知を全削除
      @notifications = current_end_user.passive_notifications.destroy_all
      redirect_to notifications_path
  end

end
