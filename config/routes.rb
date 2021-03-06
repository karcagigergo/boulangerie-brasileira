Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products do
    resources :orders, only: [:new, :create]
  end
  resources :orders, only: [:destroy]
  resources :baskets, only: [:show, :update, :destroy]
end
