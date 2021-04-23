class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # CarrierWaveでアイコンをアップロード
  mount_uploader :icon, UserIconUploader

  # マッチング
  acts_as_followable 
  acts_as_follower

  # アソシエーション
  has_many :posts, dependent: :destroy
  has_many :banners, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  # DM機能
  has_many :entries, dependent: :destroy
  has_many :messages, dependent: :destroy

  # 通知機能
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  #登録時にメールアドレスを不要とする
  def email_required?
    false
  end

  def email_changed?
    false
  end

  # すでにいいねしているかを判定するメソッド
  def already_favorited?(post)
    self.favorites.exists?(post_id: post.id)
  end

  # フォロー通知メソッド
  def create_notification_follow!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end
  
end
