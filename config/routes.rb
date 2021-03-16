Rails.application.routes.draw do
  resources :products
  resources :vendors
  resources :categories
  resources :stores
  resources :carts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
