Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #ホーム画面
  root to: 'posts#index'

  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"



  resources :posts, only: [:index, :new, :create, :show, :destroy]
  resources :banners, only: [:new, :create, :show]
  resources :users, only: [:new, :create, :show]



end
