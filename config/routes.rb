Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api do
    resources :zipcode, only: [] do
      collection do
        get :search
      end
    end

    resources :volunteers, only: [:create, :update]
  end
end
