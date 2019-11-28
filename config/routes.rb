Rails.application.routes.draw do
  devise_for :users 
  resources :users do
    resources :carts
  end
  root 'items#index'
  post 'cart_details/:id/add' => "cart_details#add_quantity", as: "cart_details_add"
  post 'cart_details/:id/reduce' => "cart_details#reduce_quantity", as: "cart_details_reduce"
  post 'cart_details' => "cart_details#create"
  get 'cart_details/:id' => "cart_details#show", as: "cart_details_show"
  delete 'cart_details/:id' => "cart_details#destroy"
  resources :items
  resources :orders
  resources :charges
end
