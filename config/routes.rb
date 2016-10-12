Rails.application.routes.draw do

  root 'welcome#hello'
  
  resources :users, only: [:new, :create, :show, :edit, :update]
  
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'

  resources :attractions, only: [:index, :new, :create, :show, :edit, :update]
  post '/rides/new', to: 'rides#new'
  
end