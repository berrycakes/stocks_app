Rails.application.routes.draw do
  devise_scope :user do
    get '/admins/new_user', to: 'users/registrations#new_admin', as: 'new_user_admin'
    devise_for :users, controllers: {
      # Used to modify controller for registrations
      # e.g. sign up and account update
      # Create a new view file under views/users folder for the controller you are going to modify
      registrations: 'users/registrations'
    }
  end
  resources :admins
  resources :traders

  root 'home#index'
end
