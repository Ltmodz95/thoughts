# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'pages#home'
  get '/home' => 'posts#index', :as => :user_root

  resources :posts do
    resources :comments
  end
end
