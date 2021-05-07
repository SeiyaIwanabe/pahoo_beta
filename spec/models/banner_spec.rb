require 'rails_helper'

describe Banner do
  describe '#create' do
    # it 'タイトルと画像があれば投稿できる' do
    #   banner = build(:banner)
    #   expect(banner).to be_valid
    # end

    it 'バナータイトルが空欄の場合は投稿できない' do
      banner = build(:banner, banner_name: '')
      banner.valid?
      expect(banner.errors[:banner_name]).to include('タイトルが空欄です。入力してください。')
    end

    it 'タイトルが21文字以上の場合は投稿できない' do
      banner = build(:banner, banner_name: 'a' * 21)
      banner.valid?
      expect(banner.errors[:banner_name]).to include('タイトルは2文字以上20文字以内です。')
    end

    it '1文字の場合は投稿できない' do
      banner = build(:banner, banner_name: 'a')
      banner.valid?
      expect(banner.errors[:banner_name]).to include('タイトルは2文字以上20文字以内です。')
    end

    it '画像が未選択の場合は投稿できない' do
      banner = build(:banner, banner_image: '')
      banner.valid?
      expect(banner.errors[:banner_image]).to include('画像を選択してください。')
    end

    # it 'タイトルが2文字以上20文字以下の場合は登録できる' do
    #   banner = build(:banner, banner_name: 'aaa')
    #   expect(banner).to be_valid
    # end

  end
end