Rails.application.routes.draw do
  namespace :api do
    resources :volunteers, only: [:create, :update]
  end
end
