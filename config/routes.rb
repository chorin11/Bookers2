Rails.application.routes.draw do
  root "users#index"
  devise_for :books
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :books, only: [:new, :create, :index, :update, :destroy]
  resources :users, only: [:show]
end
