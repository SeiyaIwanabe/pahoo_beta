class Banner < ApplicationRecord
  # Carrierwaveの設定
  mount_uploader :banner_image, BannerImageUploader

  # バリデーション
  validates :banner_name, presence: true
  # validates :banner_image, presence: true
end
