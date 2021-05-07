class Banner < ApplicationRecord
  # Carrierwaveの設定
  mount_uploader :banner_image, BannerImageUploader

  # バリデーション
  validates :banner_name, presence: true, length: { in: 2..20 }
  validates :banner_image, presence: true

  # アソシエーション
  belongs_to :user
  belongs_to :banner_tag
end
