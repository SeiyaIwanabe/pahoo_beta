class User < ApplicationRecord
  has_secure_password

  # アソシエーション
  has_many :posts, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

  # accepts_nested_attributes_for :tag_maps, allow_destroy: true

end
