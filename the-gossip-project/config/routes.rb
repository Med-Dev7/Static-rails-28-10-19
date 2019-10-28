Rails.application.routes.draw do
  get '/contact', to: 'static_pages#contact'
  get '/team', to: 'static_pages#team'
  get "/welcome/:first_name", to: 'static_pages#welcome', as: "welcome"
end
