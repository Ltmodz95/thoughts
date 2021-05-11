# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'pages#home'
  get '/home' => 'posts#index', :as => :user_root
  get 'my_posts' => 'posts#my_posts'
  get '/user_posts/:user_id', to: 'posts#user_posts', as: 'user_posts'
  resources :posts do
    resources :comments do
      resources :reactions
    end
  end
end
