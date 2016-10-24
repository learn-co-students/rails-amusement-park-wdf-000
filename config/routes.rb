Rails.application.routes.draw do

  root "welcome#home"

  get "/signin", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"
  get "/update_user", to: "attractions#update_user_stats"


  post "/rides/new", to: "rides#new"

  resources :attractions

  resources :users

end