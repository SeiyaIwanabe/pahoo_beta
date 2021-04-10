class BannerTag < ApplicationRecord

  # アソシーション
  has_many :intermediates, dependent: :destroy
  has_many :banners, through: :intermediates
end
