Rails.application.routes.draw do
  get '/contact', to: "contact#show"
  get '/team', to: "team#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end