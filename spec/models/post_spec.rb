require 'rails_helper'

describe Post do
  describe '#create' do
    it '動画ファイルと本文があれば投稿できる' do
      post = build(:post)
      expect(post).to be_valid
    end

    it '本文が空欄の場合は投稿できない' do
      post = build(:post, post_text: '')
      post.valid?
      expect(post.errors[:post_text]).to include('本文が空欄です')
    end

    it '本文が141文字以上の場合は投稿できない' do
      post = build(:post, post_text: 'a' * 141)
      expect(post).to be_invalid
    end

    it '動画ファイルがない場合は投稿できない' do
      post = build(:post, post_video: '')
      post.valid?
      expect(post.errors[:post_video]).to include('ファイルを選択してください')
    end
  end

  describe '#update' do
    it '本文が空欄の場合は更新できない' do
      post = build(:post, post_text: '')
      post.valid?
      expect(post.errors[:post_text]).to include('本文が空欄です')
    end

    it '本文が141文字以上の場合は投稿できない' do
      post = build(:post, post_text: 'a' * 141)
      expect(post).to be_invalid
    end
  end

end