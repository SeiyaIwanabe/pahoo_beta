class Connect < ApplicationRecord
  belongs_to :post, optional: true
  belongs_to :post_tag, optional: true
end
