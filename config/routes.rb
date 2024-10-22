Rails.application.routes.draw do
  get 'landmarks/index'
  get 'landmarks/show'
  get 'spots/index'
  get 'spots/show'
  get 'spots/new'
  get 'spots/edit'
  get 'home/index'
  get 'euxine', to: 'home#euxine'
  devise_for :users
  resources :spots
  resources :landmarks, only: [:index, :show]
  # Root path route
  root "home#index"

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end