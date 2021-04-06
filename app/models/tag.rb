class Tag < ApplicationRecord

  # アソシーション
  has_many :tag_maps, dependent: :destroy
  has_many :users, through: :tag_maps
end
