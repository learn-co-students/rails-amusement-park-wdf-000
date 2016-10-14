Rails.application.routes.draw do

  get 'attractions/new'

  get 'users/new'

  # get 'sessions/new'
  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  root 'users#new'

  resources :users
  resources :attractions


end
