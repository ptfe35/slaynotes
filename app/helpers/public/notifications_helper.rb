module Public::NotificationsHelper
  def unchecked_notifications
    @notifications = current_end_user.passive_notifications.where(is_checked: false)
  end
end
