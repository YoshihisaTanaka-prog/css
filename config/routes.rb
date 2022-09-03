Rails.application.routes.draw do
  resources :categories
  devise_for :admins
  resources :units
  resources :operations
  resources :values
  resources :titles
  resources :original_tags
  resources :normal_tags
  resources :products
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  get ":uid", to: "mains#data"
  post ":uid", to: "mains#data"
  root "mains#index"
end
