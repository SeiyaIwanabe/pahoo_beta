require 'rails_helper'

describe User do
  describe '#create' do

    it '名前とパスワードがあれば登録できる' do
      user = build(:user)
      expect(user).to be_valid
    end

    it '名前がなければ登録できない' do
      user = build(:user, nickname: '')
      user.valid?
      expect(user.errors[:nickname]).to include('名前が空欄です。入力してください。')
    end

    it '名前が1文字の場合は登録できない' do
      user = build(:user, nickname: 'a')
      expect(user).to be_invalid
    end

    it '名前が11文字以上の場合は登録できない' do
      user = build(:user, nickname: 'a' * 11)
      expect(user).to be_invalid
    end
    
    it '名前が2文字以上かつ10文字以内なら登録できる' do
      user = build(:user, nickname: 'a' * 9)
      expect(user).to be_valid
    end

    it 'パスワードが空の場合は登録できない' do
      user = build(:user, password: '')
      expect(user).to be_invalid
    end

    it 'パスワードが5文字以下の場合は登録できない' do
      user = build(:user, password: 'a' * 5)
      expect(user).to be_invalid
    end

    it 'パスワードが6文字以上の場合は登録できる' do
      user = build(:user, password: 'password')
      expect(user).to be_valid
    end

    it '確認用パスワードが空の場合は登録できない' do
      user = build(:user, password_confirmation: '')
      expect(user).to be_invalid
    end

    it '確認用パスワードが5文字以下の場合は登録できない' do
      user = build(:user, password_confirmation: 'a' * 5)
      expect(user).to be_invalid
    end

    it '確認用パスワードが6文字以上の場合は登録できる' do
      user = build(:user, password_confirmation: 'password')
      expect(user).to be_valid
    end

    it 'パスワードと確認用パスワードの値が不一致の場合は登録できない' do
      user = build(:user, password: 'aaaaaa', password_confirmation: 'bbbbbb')
      expect(user).to be_invalid
    end

  end

  describe '#update' do
    it "名前が空欄の場合は更新できない" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include('名前が空欄です。入力してください。')
    end
    
    it "名前が11文字以上の場合は更新できない" do
      user = build(:user, nickname: "a" * 11)
      expect(user).to be_invalid
    end
    
    it "名前が1文字以内の場合は更新できない" do
      user = build(:user, nickname: "a")
      expect(user).to be_invalid
    end
    
    it "名前が2文字以上10文字以内の場合は更新できる" do
      user = build(:user, nickname: "a" * 3)
      expect(user).to be_valid
    end

  end
end