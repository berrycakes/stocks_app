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

  resources :transactions
  resources :stocks
  resources :admins
  resources :traders
  get 'wallet/new_transactions', to: 'wallet_transaction#new', as: 'new_wallet_transaction'
  post 'wallet/transactions', to: 'wallet_transaction#create'
  get 'portfolio', to: 'transactions#portfolio'
  get 'portfolio/:id', to: 'transactions#show_portfolio'

  root 'home#index'
end
