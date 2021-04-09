class PostTag < ApplicationRecord

   # アソシーション
   has_many :connects, dependent: :destroy
   has_many :posts, through: :connects
end
