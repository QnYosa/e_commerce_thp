Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items
  resources :carts
  resources :orders
  resources :charges
end
