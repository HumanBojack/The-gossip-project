Rails.application.routes.draw do
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
end