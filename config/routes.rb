Rails.application.routes.draw do
  namespace :api do
    resources :zipcode, only: [] do
      collection do
        get :search
      end
    end

    resources :volunteers, only: [:create, :update]
  end

  root 'home#index'
end
