Rails.application.routes.draw do
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #ホーム画面 
  root to: 'home#index'
  get 'home/index'
  
  # マッチング
  put 'users/follow/:user_id', to: 'users#follow'
  put 'users/unfollow/:user_id', to: 'users#unfollow'
  
  # 検索画面
  get 'search', to: 'search#index'

  # DM機能
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show]

  # 通知機能
  resources :notifications, only: :index


  resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  resources :banners, only: [:index, :new, :create, :show, :destroy]

  resources :users, only: [:index, :new, :create, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    member do
      get :sends, :receives
    end
  end

end
