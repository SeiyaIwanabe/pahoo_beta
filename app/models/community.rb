class Community < ApplicationRecord
  has_many :community_users
  has_many :users, through: :community_users
  has_many :community_comments
  # accepts_nested_attributes_for :community_users

  # 通知機能
  has_many :notifications, dependent: :destroy

   # バリデーション
   validates :community_title, presence: true

   mount_uploader :community_icon, CommunityIconUploader
end
