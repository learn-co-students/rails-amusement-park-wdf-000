Rails.application.routes.draw do

  #
  resources :users
  get 'users/new' => 'users#new'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  #
  resources :attractions
  resources :rides
  root to: "application#home"
  resources :sessions
end
