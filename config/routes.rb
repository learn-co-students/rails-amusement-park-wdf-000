Rails.application.routes.draw do

	root 'welcome#home'
	resources :users
	resources :attractions
	post '/rides' => 'rides#create'
	get '/signin' => 'sessions#new'
	post '/signin' => 'sessions#create'
	delete '/logout' => 'sessions#destroy'
end