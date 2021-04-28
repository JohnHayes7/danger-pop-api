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

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'
  post '/authorized', to: 'sessions#is_authorized_user?'

  get '/auth/:provider/callback', to: 'sessions#omniauth'
  # get '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
