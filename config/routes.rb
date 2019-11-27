Rails.application.routes.draw do
  get 'carts/new'
  get 'carts/index'
  get 'carts/create'
  get 'carts/edit'
  get 'carts/show'
  get 'carts/destroy'
  get 'carts/update'
  devise_for :users
  root 'items#index'
  resources :items
  resources :orders
  resources :charges
end
