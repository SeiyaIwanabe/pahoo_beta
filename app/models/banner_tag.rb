class BannerTag < ApplicationRecord

  # アソシーション
  has_many :banners, dependent: :destroy
end
