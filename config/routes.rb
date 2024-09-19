Rails.application.routes.draw do
  get 'home/index'
  devise_for :users

  # Root path route
  root "home#index"

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end