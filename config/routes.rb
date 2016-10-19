Rails.application.routes.draw do


  resources :users
  get '/' => "users#index"
  get '/signin' => "users#signin", as: "user_signin"
  post '/signin' => "users#getid", as: "user_getid"
  delete '/signout' => "users#signout"
  get '/attractions/new' => "attractions#new", as: "attraction_new"
  post '/attractions/create' => "attractions#create"

  get '/attractions/:id/edit' => "attractions#edit", as: "attraction_edit"
  post '/attractions/:id/update' => "attractions#update"

  get '/attractions' => "attractions#index"
  get '/attractions/:id' => "attractions#show", as: "attraction"






end
