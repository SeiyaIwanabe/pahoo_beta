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
  
end
