class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # user_idとpost_idの組は1通りのみ（一人一回までいいねできる）
  validates_uniqueness_of :post_id, scope: :user_id
end
