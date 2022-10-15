Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'

  devise_scope :user do get '/users/sign_out' => 'devise/sessions#destroy' end

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create, :new] do
      resources :likes, only: [:create] 
      resources :comments, only:[:create, :new]
    end
  end

  resources :users do
    member do
      get 'api_token'
    end
  end

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show] do
        resources :posts, only: [:index, :show] do
          resources :comments, only: [:new, :create] do
          end
        end
      end
    end
  end
end
