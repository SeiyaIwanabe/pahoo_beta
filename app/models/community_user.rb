class CommunityUser < ApplicationRecord
  has_many :community_users
  has_many :users, through: :community_users

  # バリデーション
  validates :community_name, presense: true, uniquness: true
end
