Rails.application.routes.draw do
  resources :stocks
  post 'search', to: 'stocks#search'
  post 'calculate', to: 'stocks#calculate'

  root 'stocks#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
