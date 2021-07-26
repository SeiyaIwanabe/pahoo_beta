class TagMap < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :tag, optional: true
end
