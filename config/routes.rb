Rails.application.routes.draw do
  resources :users
  resources :attractions
  root 'application#home'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'

  post 'ride' => 'rides#create'

end
