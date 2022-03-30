Rails.application.routes.draw do
  devise_for :users
  get 'users', to: 'users#index', as: 'users'
  get 'users/:id', to: 'users#show', as: 'user'

  # temporary home page
  root 'users#index'
end
