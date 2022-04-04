Rails.application.routes.draw do
  devise_scope :user do
    get '/admins/traders/:id/edit', to: 'users/registrations#edit_trader', as: 'admin_edit_trader'
    patch '/admins/traders/:id', to: 'users/registrations#update_trader', as: 'admin_update_trader'

    devise_for :users, controllers: {
      # Used to modify controller for registrations
      # e.g. sign up and account update
      # Create a new view file under views/users folder for the controller you are going to modify
      registrations: 'users/registrations'
    }
  end

  resources :stocks
  post 'search', to: 'stocks#search'
  post 'calculate', to: 'stocks#calculate'

  resources :admins
  resources :traders

  root 'home#index'
end
