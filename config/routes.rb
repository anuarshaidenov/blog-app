Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "users#index"
  # Define endpoints for
  post '/api/login', to: 'authentication#login'
  get '/api/posts', to: 'posts#posts'
  get '/api/comments', to: 'comments#comments'
  post '/api/comments', to: 'comments#add_comment'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:create]
    end
  end

  # Defines the root path route ("/")
end
