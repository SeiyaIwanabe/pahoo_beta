class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # IDを自動生成
  generate_public_uid

  # 5-12文字の半角英数字（更新時のみのバリデーション※新規登録時には自動でランダム登録）
  validates :public_uid, presence: true, on: :update
  validates :public_uid, format: { with: /\A[a-z0-9]+\z/i }, on: :update
  validates :public_uid, length: { minimum: 5, maximum: 12 }, on: :update
  validates :email, uniqueness: true

  # CarrierWaveでアイコンをアップロード
  mount_uploader :icon, UserIconUploader

  # フォロー関連
  acts_as_followable
  acts_as_follower

  # アソシエーション
  has_many :posts, dependent: :destroy
  has_many :banners, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :community_users
  has_many :communities, through: :community_users
  has_many :community_comments

  # DM機能
  has_many :entries, dependent: :destroy
  has_many :messages, dependent: :destroy

  # 通知機能
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy


  # バリデーション
  validates :nickname, presence: true,  length: { in: 2..10 }
  # validates :password, presence: true,  length: { minimum: 6 }
  # validates :password, presence: true,  length: { minimum: 6 }


  #登録時にメールアドレスを不要とする
  def email_required?
    false
  end

  def email_changed?
    false
  end

  # フォローしているかどうかの判定メソッド
  def senderd_by?(user)
    # 今自分(引数のuser)がフォローしようとしているユーザー(レシーバー)がフォローされているユーザー(つまりpassive)の中から、引数に渡されたユーザー(自分)がいるかどうかを調べる
    passive_relationships.find_by(sender_id: user.id).present?
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
