Rails.application.routes.draw do
  devise_for :users, controllers: {
    # Used to modify controller for registrations
    # e.g. sign up and account update
    # Create a new view file under views/users folder for the controller you are going to modify
    registrations: 'users/registrations'
  }

  resources :admins
  resources :traders

  root 'home#index'
end
