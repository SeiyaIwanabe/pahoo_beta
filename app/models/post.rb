class Post < ApplicationRecord
  # Carrierwave
  mount_uploader :post_video, PostVideoUploader

  # バリデーション
  validates :post_text, presence: true
  validates :post_video, presence: true

  # アソシエーション
  belongs_to :user
  has_many :connects, dependent: :destroy
  has_many :post_tags, through: :connects
  has_many :favorites, dependent: :destroy
end
