Rails.application.routes.draw do
  resources :uploads_controllers
  resources :uploads
  root to: 'uploads#index'
   namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end

  # For controllers to use warp_controller, declare warp_resources here:
  warp_resources :documents, :changes, :portfolios
  resources :portfolios, only: [:index, :create, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
