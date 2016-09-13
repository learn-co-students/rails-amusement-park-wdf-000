Rails.application.routes.draw do
  get '/users/new' => 'sessions#new', as: 'sign_up'
  post '/users' => 'sessions#create'

  get '/signin' => 'sessions#signin', as: 'sign_in'
  post '/signin' => 'sessions#login'

  post '/logout' => 'sessions#destroy', as: 'logout'

  post '/rides' => 'rides#create'

  root to: 'application#index'
  resources :users, only: [:show, :index]
  resources :attractions, only: [:new, :create, :edit, :update, :show, :index]
end