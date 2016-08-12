Rails.application.routes.draw do

  resources :users

  resources :attractions

  get '/signin', to: 'users#signin'
  get '/logout', to: 'users#logout'
  post '/login', to: 'users#login'
  post 'attractions/:id', to: 'attractions#ride', as: 'ride'

  root to: 'users#index'

end
