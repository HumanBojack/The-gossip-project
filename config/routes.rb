Rails.application.routes.draw do
	root "gossips#index"
	resources :gossips do
		resources :comments, except: [:show, :index]
		resources :likes
	end
	resources :users
	resources :cities, only: [:create, :show]
	resources :sessions, only: [:new, :create, :destroy]
		
	get "/profile", to: "users#profile"
  get 'welcome/:name', to: "welcome#show"
  get '/contact', to: "contact#show"
  get '/team', to: "team#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end