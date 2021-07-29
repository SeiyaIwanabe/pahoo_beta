class CommunityComment < ApplicationRecord
  belongs_to :community
  belongs_to :user

  # 通知機能
  has_many :notifications, dependent: :destroy

  validates :community_comment, presence: true
end
