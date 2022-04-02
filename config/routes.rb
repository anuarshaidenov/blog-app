Rails.application.routes.draw do
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end

  resources :posts do
    resources :comments, only: %i[create new update destroy]
    resources :likes, only: %i[create]
  end
  # Defines the root path route ("/")
  root "users#index"
end