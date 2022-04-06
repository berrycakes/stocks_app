Rails.application.routes.draw do
  devise_scope :user do
    get '/admins/traders/:id/edit', to: 'users/registrations#edit_trader', as: 'admin_edit_trader'
    patch '/admins/traders/:id', to: 'users/registrations#update_trader', as: 'admin_update_trader'
    # TEMPORARY FIX FOR DELETING
    # bypass incompatible architecture issue with bcrypt
    post '/forced', to: 'users/sessions#forced_login', as: 'forced_login'

    devise_for :users, controllers: {
      # Used to modify controller for registrations
      # e.g. sign up and account update
      # Create a new view file under views/users folder for the controller you are going to modify
      registrations: 'users/registrations',
      # TEMPORARY FIX FOR DELETING
      sessions: 'users/sessions'
    }
  end

  resources :transactions
  resources :stocks

  resources :admins
  resources :traders
  get 'portfolio', to: 'transactions#portfolio'
  get 'portfolio/:id', to: 'transactions#show_portfolio'

  root 'home#index'
end
