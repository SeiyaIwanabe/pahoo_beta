module NotificationsHelper

  def notification_form(notification)
    @comment = nil
    visitor = link_to notification.visitor.nickname, notification.visitor, style:"font-weight: bold;"
    your_post = link_to 'あなたの投稿', notification.post, style:"font-weight: bold;"
    case notification.action
      when "follow" then
        "#{visitor}さんがあなたをフォローしました"
      when "favorite" then
        "#{visitor}さんが#{your_post}にいいね！しました"
      when "comment" then
        @comment = Comment.find_by(id: notification.comment_id)&.content
        "#{visitor}さんが#{your_post}にコメントしました"
      when "DM" then
        "#{visitor}さんがあなたにメッセージを贈りました!"
    end
  end

  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end

end
