class Connect < ApplicationRecord
  belongs_to :post
  belongs_to :post_tag
end
