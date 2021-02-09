Rails.application.routes.draw do
	root "gossips#index"
	resources :gossips
	# get "gossips/:id", to: "gossips#show"
  get 'welcome/:name', to: "welcome#show"
  get '/contact', to: "contact#show"
  get '/team', to: "team#show"
  get 'author/:id', to: "author#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end