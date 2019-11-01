Rails.application.routes.draw do
  # get 'user_options/new'
  # get 'user_options/create'
  # get 'user_options/delete'
  # get 'user_options/update'
  # get 'user_options/index'
  # get 'users/new'
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  root :to => "static_pages#index"
  # get 'gossips/new'
  # get 'gossips/create'
  get 'static_pages/index', to: 'static_pages#index' 
  get 'user/:id', to: 'static_pages#user', as: 'user'
  # get "gossip/:id", to: "static_pages#gossip", as: 'gossip'
  get '/contact', to: 'static_pages#contact'
  get '/team', to: 'static_pages#team'
  get "/welcome/:first_name", to: 'static_pages#welcome', as: "welcome"# il me faudrait une autre route qui s appel welcome sans parametre pour pas a avoir cree un overriding

  resources :gossips, only: [:new, :create, :index, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new]
# ajouter ressource pour dashboard ppour crud
  # resources :UserOptions

end
