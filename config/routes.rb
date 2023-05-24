# Rails.application.routes.draw do
#   namespace :api do
#     resources :users, only: [:index, :show, :create, :update, :destroy]
#     resources :messages, only: [:index, :show, :create, :update, :destroy]
#     resources :chatrooms, only: [:index, :show, :create, :update, :destroy]
#   end
  
# end
Rails.application.routes.draw do
  namespace :api do
    resources :chatrooms do
      resources :messages, only: [:index, :create]
    end
  end
end

# Rails.application.routes.draw do
#   namespace :api do
#     resources :chatrooms, only: [:index, :show, :create, :update, :destroy] do
#       resources :messages, only: [:index, :create]
#     end
#     resources :users, only: [:index, :show, :create, :update, :destroy]
#   end
# end

# namespace :api do
#   resources :chatrooms do
#     resources :messages, only: [:index, :create]
#   end
# end
