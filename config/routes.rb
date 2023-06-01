Rails.application.routes.draw do
  devise_for :users

  resources :ducks
  resources :bookings, only: [:index, :show]

  # Defines the root path route ("/")
  # root "pages#index"
  root to: "ducks#index"
end
