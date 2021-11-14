Rails.application.routes.draw do
  root 'static#home'
  get '/signin', to: 'session#new'
  post '/signin', to: 'session#create'
  # get '/signup', to: 'users#new'
  # post '/signup', to: 'users#create'
  
  resources :rides, only: [:create]
  resources :session, only: [:destroy]
  resources :users, only: [:new, :create, :show]
  resources :attractions

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
