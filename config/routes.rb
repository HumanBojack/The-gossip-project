Rails.application.routes.draw do
<<<<<<< HEAD
  root "gossips#index"
  resources :gossips
#	get "gossips/:id", to: "gossips#show"
  get 'welcome/:name', to: "welcome#show"
  get '/contact', to: "contact#show"
  get '/team', to: "team#show"
  get 'author/:id', to: "author#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

=======
  resources :gossips
  
  resources :gossips do
    resources :comments
  end

	# root "gossips#list"
	# get "gossips/:id", to: "gossips#show"
  # get 'welcome/:name', to: "welcome#show"
  # get '/contact', to: "contact#show"
  # get '/team', to: "team#show"
  # get 'author/:id', to: "author#show"
>>>>>>> 54f104284a5046e5b0547da049472a6b137e31f8
end