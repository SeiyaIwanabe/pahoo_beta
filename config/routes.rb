Rails.application.routes.draw do
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #ホーム画面 
  root to: 'home#index'
  get 'home/index'
  
  # フォロー機能
  put 'users/follow/:user_id', to: 'users#follow'
  put 'users/unfollow/:user_id', to: 'users#unfollow'
  get 'users/follow_list/:user_id',to: 'users#follow_list'
  get 'users/follower_list/:user_id',to:'users#follower_list'
  
  # 検索画面
  get 'search', to: 'search#index'

  # DM機能
  resources :messages, only: [:create]
  resources :rooms, only: [:index, :create, :show]

  # 通知機能
  resources :notifications, only: :index

  # コミュニティ機能
  resources :communities, only: [:index, :show, :new, :create, :edit, :update] do
    resources :community_comments, only: [:create, :destroy]
  end


  resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  resources :banners, only: [:index, :new, :create, :show, :destroy]

  resources :users, only: [:index, :new, :create, :show, :edit, :update]

end
