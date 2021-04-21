Rails.application.routes.draw do
  resources :project_notes
  resources :dimensions
  resources :sizes
  resources :notes
  resources :artists
  resources :appointments
  resources :projects
  resources :tattoo_requests
  resources :products
  resources :vendors
  resources :categories
  resources :stores
  resources :carts
  resources :users

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessioons#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
