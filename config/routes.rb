Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	resources :users, :attractions 

	root 'welcome#home'

	get '/signin' => 'sessions#new'
	post '/signin' => 'sessions#create'
	post '/logout' => 'sessions#destroy'

	post '/ride' => 'rides#create'
end
