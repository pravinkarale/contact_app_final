Rails.application.routes.draw do
  root 'homes#index'
  namespace :api do
    resources :users, only: [:create]
  end
end
