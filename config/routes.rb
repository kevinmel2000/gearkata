Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  # You can have the root of your site routed with "root"
  root 'application#home'

  resources :categories
  resources :expeditions
  resources :gear_lists
  resources :items
  resources :users, only: [:show]

  get '/flash_test' => 'application#flash_test'

  # Catch the path to a list
  get "/:list_uuid" => "gear_lists#view", constraints: GearListConstraint.new

  get '/about' => 'home#about'
end
