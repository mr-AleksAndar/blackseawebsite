Rails.application.routes.draw do
  devise_for :users

  # Root path route
  root "home#index"

  # Static pages
  get 'home/index'
  get 'club', to: 'home#club'
  get 'codex', to: 'home#codex'

  # Existing resources
  resources :spots, only: [:show]
  resources :landmarks, only: [:index, :show]

  # Shop routes
  resources :products, only: [:index, :show]
  resources :orders, only: [:new, :create]

  # Robots.txt and favicon.ico
  match '/robots.txt', to: proc { [200, {}, [Rails.root.join('public', 'robots.txt').read]] }, via: :all
  match '/favicon.ico', to: proc { [204, {}, []] }, via: :all

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Catch-all route (keep at the bottom to avoid conflicts)
  match '*path', to: redirect('/'), via: :all
end