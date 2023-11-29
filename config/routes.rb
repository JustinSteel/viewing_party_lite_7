Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "landing#index"

  get "/register", to: "register#index"
  post "/register", to: "users#create"

  resources :users, only: [:show] do
    get "/discover", to: "users#index"
    resources :movies, only: [:index]
  end
end
