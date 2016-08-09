Rails.application.routes.draw do
  root 'application#hello'
  resources :sessions, only: [:create]
  get '/signin', to: 'sessions#new', as: 'new_session'
  delete '/logout', to: 'sessions#destroy', as: 'destroy_session'
  resources :rides, only: :create

  resources :attractions

  resources :users

end
