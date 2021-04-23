class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  # 通知機能
  has_many :notifications, dependent: :destroy

  # バリデーション
  validates :text, presence: true
end
