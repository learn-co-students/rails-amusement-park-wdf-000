Rails.application.routes.draw do

  resources :users
  get '/' => 'users#index'
  get '/signin' => 'users#signin', as: 'user_signin'
  post '/signin' => 'users#getid'
  delete '/signout' => 'users#signout'
    get '/attractions/new' => 'attractions#new', as: 'attraction_new'
  get '/attractions' => 'attractions#index'
  get '/attractions/:id' => 'attractions#show', as: 'attraction'
  post '/attractions/create' => 'attractions#create'
  get '/attractions/:id/edit' => 'attractions#edit', as: 'attraction_edit'
  post '/attractions/:id' => 'attractions#update'

end
