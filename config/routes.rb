Rails.application.routes.draw do
  get '/contacts' => "contact_messages#new"
  resources :contact_messages, only: :new
  root "contact_messages#new"
  namespace :api do
    resources :contact_messages, only: [:create]
  end
  match '*unmatched_route', :to => 'application#route_not_found', via: [:get, :post]
end
