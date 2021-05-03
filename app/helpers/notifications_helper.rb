module NotificationsHelper

  def notification_form(notification)
    @comment = nil
    visitor = link_to notification.visitor.nickname, notification.visitor, class: "visitorName"
    your_post = link_to "あなたの投稿", notification.post, class: "visitedPostLink"
    case notification.action
      when "follow" then
        "#{visitor}さんがあなたにマッチング申請をしました！プロフィールを覗いてみましょう"
      when "favorite" then
        "#{visitor}さんが#{your_post}にいいね！しました"
      when "comment" then
        @comment = Comment.find_by(id: notification.comment_id)&.content
        "#{visitor}さんが#{your_post}にコメントしました"
      when "DM" then
        @message = Message.find_by(id: notification.message_id)&.text
        "#{visitor}さんがあなたにメッセージを贈りました!"
    end
  end

  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end

end
