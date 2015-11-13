Rails.application.routes.draw do
 
  get 'welcome/index'

  # user posts and sessions routes
  resources :users, :posts
  resources :sessions, only: [:new, :create, :destroy]
  resources :cities, only: [:show]

  # root route
  root 'welcome#index'

  #auth routes
  get '/signup', to: 'users#new', as: :signup

  get '/profile', to: 'users#show', as: :profile

  get '/login', to: 'sessions#new', as: :login

  get '/logout', to: 'sessions#destroy', as: :logout

end
