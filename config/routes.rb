Rails.application.routes.draw do
  get 'ducks/index'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :ducks, only: [:index, :show]
  # Defines the root path route ("/")
  #root "pages#index"
end
