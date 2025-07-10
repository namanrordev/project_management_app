Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  delete "/logout", to: "sessions#destroy", as: :logout

  resources :proposals do
    resources :co_authors, only: [:create, :index, :update]
    resources :proposal_costs, only: [:new, :create, :destroy]
    member do
      post :approve
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "sessions#new"

  get 'compare_proposals', to: 'proposals#compare', as: 'compare_proposals'
end
