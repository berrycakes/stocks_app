Rails.application.routes.draw do
  resources :admins
  resources :traders
  devise_for :users

  root 'home#index'
end
