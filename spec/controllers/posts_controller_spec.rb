require 'rails_helper'

describe PostsController do

  describe 'GET #new' do
    it 'posts/new画面に遷移するか' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it 'assign the requested post to @post' do
      post = create(:post)
      get :edit, params: { id: post } 
      expect(assigns(:post)).to eq post
    end

    it 'posts/edit画面に遷移するか' do
      post = create(:post)
      get :edit, params: { id: post } 
      expect(response).to render_template :edit
    end
  end

  # describe 'GET #index' do
  #   it 'populates an array of posts ordered by created_at DESC' do
      
  #   end

  #   it 'posts/indexに遷移するか' do
      
  #   end
  # end
  
end
