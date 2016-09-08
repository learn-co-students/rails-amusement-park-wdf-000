Rails.application.routes.draw do

  resources :users
  resources :attractions

  post '/create_new_ride' => 'rides#create'
  resources :rides
  get '/signin' => 'login#new'
  post '/signin' => 'login#create'
  get '/logout' => 'login#destroy'
  root 'users#new'
  # get '/' => 'users#new', as: '/user/signup'
  #
  # get '/user/signup' => 'users#new', as: '/user/signup'
  # post '/users/new' => 'users/create'
  
end
