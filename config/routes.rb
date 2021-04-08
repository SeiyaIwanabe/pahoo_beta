Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #ホーム画面
  root to: 'posts#index'
  
  # ログイン関連
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
  
  # 検索画面
  get 'search', to: 'search#index'


  resources :posts, only: [:index, :new, :create, :show, :destroy]
  resources :banners, only: [:new, :create, :show]
  resources :users, only: [:index, :new, :create, :show, :edit, :update]



end
