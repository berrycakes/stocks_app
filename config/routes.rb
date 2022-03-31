Rails.application.routes.draw do
  resources :traders
  devise_for :users

  root 'home#index'
end
