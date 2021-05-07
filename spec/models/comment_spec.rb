require 'rails_helper'

describe Comment do
  describe '#create' do
    it '本文が空欄の場合はコメントできない' do
      comment = build(:comment, content: '')
      comment.valid?
      expect(comment.errors[:content]).to include('コメントが空欄です。入力してください。')
    end
  end
end