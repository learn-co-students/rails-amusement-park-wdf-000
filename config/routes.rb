Rails.application.routes.draw do
  root 'welcome#home'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/signout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users/:id', to: 'users#show', as: :user
  get '/users/:id/edit', to: 'users#edit', as: :user_edit
  post '/users/:id/edit', to: 'users#update'
  post '/users/:id/destroy', to: 'users#destroy'
end