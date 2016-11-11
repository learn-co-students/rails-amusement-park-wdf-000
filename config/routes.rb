Rails.application.routes.draw do

  root "home_page#welcome"
  # resources :sessions
  resources :users
  resources :attractions
  resources :rides

  post "/rides/new", to: "rides#new"

  get "/signin", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  get "/signout", to: "sessions#destroy"


end
