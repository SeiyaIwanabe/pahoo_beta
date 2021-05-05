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

  # ====================自分がフォローしているユーザーとの関連 ===================================
  #フォローする側のUserから見て、フォローされる側のUserを(中間テーブルを介して)集める。なので親はsender_id(フォローする側)
  has_many :active_relationships, class_name: "Relationship", foreign_key: :sender_id, dependent: :destroy
  # 中間テーブルを介して「follower」モデルのUser(フォローされた側)を集めることを「senders」と定義
  has_many :senders, through: :active_relationships, source: :recipient
  # ========================================================================================

  # ====================自分がフォローされるユーザーとの関連 ===================================
  #フォローされる側のUserから見て、フォローしてくる側のUserを(中間テーブルを介して)集める。なので親はrecipient_id(フォローされる側)
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :recipient_id, dependent: :destroy
  # 中間テーブルを介して「following」モデルのUser(フォローする側)を集めることを「recipients」と定義
  has_many :recipients, through: :passive_relationships, source: :sender
  # =======================================================================================

  # has_many :sender_relationships, foreign_key: "recipient_id", class_name: "Relationship",  dependent: :destroy
  # has_many :senders, through: :sender_relationships
  # has_many :recipient_relationships, foreign_key: "sender_id", class_name: "Relationship", dependent: :destroy
  # has_many :recipients, through: :recipient_relationships




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

  # #フォローしているかを確認するメソッド
  # def sending?(user)
  #   sender_relationships.find_by(sender_id: user.id)
  # end

  # #フォローするときのメソッド
  # def send(user)
  #   sender_relationships.create!(sender_id: user.id)
  # end

  # #フォローを外すときのメソッド
  # def unsend(user)
  #   sender_relationships.find_by(sender_id: user.id).destroy
  # end

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
