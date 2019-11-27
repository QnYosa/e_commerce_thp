Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items
  resources :users do
    resources :carts
  end
  resources :orders
  resources :charges
end
