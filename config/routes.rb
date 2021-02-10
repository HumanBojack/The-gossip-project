Rails.application.routes.draw do
	root "gossips#index"
	resources :gossips do
		resources :comments, except: [:show, :index]
	end
	resources :user
	resources :cities, only: [:create, :show]
		
	# get "gossips/:id", to: "gossips#show"
  get 'welcome/:name', to: "welcome#show"
  get '/contact', to: "contact#show"
  get '/team', to: "team#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end