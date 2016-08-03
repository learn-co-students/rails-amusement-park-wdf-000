Rails.application.routes.draw do
  root 'users#index'
  resources :users, :attractions

  get 'signin' => 'users#signin', as: 'signin_user'
  post 'login' => 'users#login'
  get 'logout' => 'users#logout', as: 'logout_user'

  post 'take_ride' => 'attractions#take_ride', as: 'take_ride'

end
