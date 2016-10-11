Rails.application.routes.draw do

  # resources :users
  root to: 'welcome#home'

    resources :users
    resources :attractions

    get '/signin', to: 'sessions#new'
    post '/signin', to: 'sessions#create'
    delete '/signout', to: 'sessions#destroy'

    post '/attractions/:id', to: 'rides#create'

end
