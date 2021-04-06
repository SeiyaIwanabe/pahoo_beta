class Post < ApplicationRecord
  # Carrierwave
  mount_uploader :post_video, PostVideoUploader

  # バリデーション
  validates :post_text, presence: true
  validates :post_video, presence: true

  # アソシエーション
  belongs_to :user
end
