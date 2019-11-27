Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items
  resources :orders
  resources :users do
    resources :carts
  end
  resources :charges
end
