Rails.application.routes.draw do
  root to: 'welcome#home'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :attractions
end
