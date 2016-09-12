Rails.application.routes.draw do
  root "users#index"

  resources :users, :sessions, :attractions
  get "/signin", to: 'sessions#new', as: "signin"
  get '/signout', to: 'sessions#destroy', as: "signout"
  get '/attractions/:id/ride', to: 'attractions#ride', as: "ride"
end

