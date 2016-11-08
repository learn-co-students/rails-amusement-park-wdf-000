Rails.application.routes.draw do

resources :users
resources :attractions
resources :rides

root 'welcome#home'
get 'users/new' => 'users/new'
get '/signin', to: 'sessions#new'
post '/signin', to: 'sessions#create'
get '/logout', to: 'sessions#destroy'

end
