Rails.application.routes.draw do
  resources :request_windows
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

  # post '/login', to: 'sessions#create'
  post '/login', to: 'auth#login'
  get '/auto_login', to: "auth#auto_login"
  get '/user_is_authed', to: 'auth#user_is_authed'
  delete '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'application#is_logged_in?'
  post '/authorized', to: 'auth#is_authorized_user?'
  post '/password/forgot', to: 'passwords#forgot'
  post '/password/reset', to: 'passwords#reset'

  

  get '/auth/:provider/callback', to: 'sessions#omniauth'
  # get '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
