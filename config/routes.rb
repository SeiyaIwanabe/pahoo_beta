Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'posts#index'

  resources :posts, only: [:index, :new, :create, :show, :destroy]
  resources :banners, only: [:new, :create, :show]
  resources :users, only: [:new, :create, :show]



end
