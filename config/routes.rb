Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :users
  resources :attractions
  post 'attractions/:id', to: 'rides#create'

  get '/signin', to: 'users#signin'
  post '/signin', to: 'users#login', as: 'login'
end
