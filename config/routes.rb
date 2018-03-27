Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    post 'auth/register', to: 'users#register', as: :register
    post 'auth/login', to: 'users#login', as: :login
    post 'check_token', to: 'users#check_token'

    resources :users, only: :index
  end
end
