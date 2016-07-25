Rails.application.routes.draw do
  root to: 'welcome#home'

  resources :users

  resources :attractions
  post 'attractions/ride', to: 'attractions#ride'

  get '/signin', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
