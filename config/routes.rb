Rails.application.routes.draw do
  devise_for :users 
  resources :users do
    resources :carts
  end
  root 'items#index'
  resources :items do
    resources :avatars, only: [:create]
  end
  resources :orders
  resources :charges
  get 'mon_panier', to: 'carts#show'
  #admin baby
  namespace :admin do
    root "admin#index"
    resources :users, :carts, :orders, :items
  end
end
