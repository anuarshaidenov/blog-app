Rails.application.routes.draw do
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end

  # Defines the root path route ("/")
  root "users#index"
end
