Rails.application.routes.draw do
  namespace :api do
    resources :users, only: [:index, :show, :create, :update, :destroy]
    resources :messages, only: [:index, :show, :create, :update, :destroy]
    resources :chatrooms, only: [:index, :show, :create, :update, :destroy]
  end
  
end
