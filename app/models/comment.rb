class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # 通知機能
  has_many :notifications, dependent: :destroy

  # バリデーション
  validates :content, presence: true, length: {maximum: 140}
end
