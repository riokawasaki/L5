Rails.application.routes.draw do
  get 'top/index'
  get 'top/new'
  get 'tops/index'
  get 'tops/new'
  get 'users/index'
  resources :users
  resources :top , except: [:show]
  resources :likes
  root 'top#main'
  get 'top/main'
  post 'top/login'
  get 'top/error'
  get 'top/logout'
  get 'users/error'
  #get 'tweets/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  #get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
