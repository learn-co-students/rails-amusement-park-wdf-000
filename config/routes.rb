Rails.application.routes.draw do

 root 'welcome#hello'

 resources 'users'
 post '/rides/new', to: 'rides#new'

 get 'signin', to: 'sessions#new'
 post 'signin', to: 'sessions#create'
 get 'signout', to: 'sessions#destroy'

 resources 'attractions'

end
