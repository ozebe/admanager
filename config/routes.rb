Rails.application.routes.draw do
  resources :categories
  resources :adverts
  devise_for :users
  resources :users
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
