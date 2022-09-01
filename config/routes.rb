Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :bids
  get '/my_missions', to: 'missions#my_missions', as: 'my_missions'
  resources :missions do
    resources :bids, only: %i[index show new create edit update destroy]
  end

  patch '/custombids/:id', to: 'bids#accept_bid', as: 'accept'

end
