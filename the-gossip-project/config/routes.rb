Rails.application.routes.draw do
  root :to => "static_pages#index"
  # get 'gossips/new'
  # get 'gossips/create'
  get 'static_pages/index', to: 'static_pages#index' 
  get 'user/:id', to: 'static_pages#user', as: 'user'
  # get "gossip/:id", to: "static_pages#gossip", as: 'gossip'
  get '/contact', to: 'static_pages#contact'
  get '/team', to: 'static_pages#team'
  get "/welcome/:first_name", to: 'static_pages#welcome', as: "welcome"
  
  resources :gossips, only: [:new, :create]
end
