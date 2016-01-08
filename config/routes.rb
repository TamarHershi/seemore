Rails.application.routes.draw do
  root 'users#show'
  post "/auth/developer/callback", to: "sessions#create"
  get "/auth/:provider/callback", to: "sessions#create"

  resources :sessions, except: [:update]
  resources :creators
  get "/search" => "searches#search", as: :search
  delete "/logout" => "sessions#destroy", as: :logout
  
end
