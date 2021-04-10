class Intermediate < ApplicationRecord
  # アソシエーション
  belongs_to :banner
  belongs_to :banner_tag
end
