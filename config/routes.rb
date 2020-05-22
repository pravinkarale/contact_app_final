Rails.application.routes.draw do
  root 'homes#index'
  namespace :api do
    resources :users, only: [:create]
  end
  match '*path' => redirect('/'), via: :get
end
