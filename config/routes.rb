Rails.application.routes.draw do
  get 'home/about' => 'home#about'

  root "home#top"

  get 'search' => 'searches#search'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :users

  resources :books do
    resources :book_comments, only:[:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  
  resources :users, only: [:index, :create, :update, :show, :edit]

  resources :relationships, only: [:create, :destroy]
end
