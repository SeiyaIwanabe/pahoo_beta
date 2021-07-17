class CommunityComment < ApplicationRecord
  belongs_to :community
  belongs_to :user

  validates :community_comment, presence: true
end
