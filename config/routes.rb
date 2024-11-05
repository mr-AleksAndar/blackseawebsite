Rails.application.routes.draw do
  get 'landmarks/index'
  get 'landmarks/show'
  get 'spots/index'
  get 'spots/show'
  get 'spots/new'
  get 'spots/edit'
  get 'home/index'
  get 'club', to: 'home#club'
  get 'codex', to: 'home#codex'
  devise_for :users
  resources :spots ,only: [:show]  # This will only create the route for showing individual spots
  resources :landmarks, only: [:index, :show]
  # Root path route
  root "home#index"

  match '/robots.txt', to: proc { [200, {}, [Rails.root.join('public', 'robots.txt').read]] }, via: :all
  match '/favicon.ico', to: proc { [204, {}, []] }, via: :all
  
  match '*path', to: redirect('/'), via: :all
  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end