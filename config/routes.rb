Rails.application.routes.draw do
  root "books#home"
  devise_for :books
  devise_for :users

  resources :books, only: [:new, :create, :index, :update, :show, :destroy]
  resources :users, only: [:index, :create, :update, :show, :edit]
end
