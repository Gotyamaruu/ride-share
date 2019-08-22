Rails.application.routes.draw do
  devise_for :users
  root 'shares#index'
  resources :shares do
  end
  resource :users, only: [:show]
end

