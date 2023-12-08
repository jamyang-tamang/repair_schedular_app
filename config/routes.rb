Rails.application.routes.draw do

  
  resources :subscribers
  resources :vehicles
  resources :availabilities

  root "availabilities#index"
  get "/markets", to: "markets#index"

  get '/login',   to: 'sessions#login', as: :new
  post '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get "/logout", to: "sessions#destroy"
  get "/signup", to: "subscribers#new", as: :signup
  post "/subscriber", to: "subscriber#create"  
  get '/new_vehicle', to: 'vehicles#new'
  get '/allot_vehicle_to_self', to: 'subscribers#allot_vehicle_to_self', as: 'allot_vehicle_to_self'
  get '/un_allot_vehicle', to: 'subscribers#un_allot_vehicle', as: 'un_allot_vehicle'
  get '/allot_to_user', to: 'availabilities#allot_to_user', as: 'allot_to_user'
  get '/un_allot_to_user', to: 'availabilities#un_allot_to_user', as: 'un_allot_to_user'
end