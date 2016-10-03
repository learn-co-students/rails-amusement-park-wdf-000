Rails.application.routes.draw do
  root to: 'welcome#home'

  get '/signin', to: 'sessions#new'
  resources :users
end
