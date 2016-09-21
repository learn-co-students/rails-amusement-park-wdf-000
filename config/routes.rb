Rails.application.routes.draw do
  get '/' => 'welcome#home'

  get '/signin' => 'sessions#new'
  post '/log_in' => 'sessions#create'
  delete '/log_out' => 'sessions#destroy'

  resources :users
  resources :attractions
  resources :rides

end
