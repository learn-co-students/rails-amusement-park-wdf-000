Rails.application.routes.draw do
  root 'welcome#home'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy'

  get '/users/new', to: 'users#new', as: 'users'
  post '/users/new', to: 'users#create'
  get '/users/:id', to: 'users#show', as: :user
  get '/users/:id/edit', to: 'users#edit', as: :user_edit
  post '/users/:id/edit', to: 'users#update'
  post '/users/:id/destroy', to: 'users#destroy'

  resources :attractions
end