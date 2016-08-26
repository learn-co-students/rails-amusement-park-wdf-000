Rails.application.routes.draw do
  resources :users
  resources :attractions
  # get '/users/:id', to: 'users#show'
  get '/signin', to: 'users#login'
  post '/users/now', to: 'users#now'
  post '/attractions/take_ride', to: 'attractions#take_ride'
  root to: 'users#index'
end
