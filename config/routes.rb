Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :admins
  resources :traders

  root 'home#index'
end
