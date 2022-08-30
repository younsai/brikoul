Rails.application.routes.draw do
  get 'bids/index'
  get 'bids/show'
  get 'bids/new'
  get 'bids/create'
  get 'bids/edit'
  get 'bids/update'
  get 'bids/destroy'
  get 'bidss/index'
  get 'bidss/show'
  get 'bidss/new'
  get 'bidss/create'
  get 'bidss/edit'
  get 'bidss/update'
  get 'bidss/destroy'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  authenticated :user do
  end
  resources :missions
  resources :bids, only: %i[index show edit update destroy]
  resources :missions do
    resources :bids, only: %i[index show new create edit update]
  end
end
