Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  delete "/logout", to: "sessions#destroy", as: :logout

  resources :proposals do
    resources :co_authors, only: [:create, :index, :update]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "sessions#new"
end
