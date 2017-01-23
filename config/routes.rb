Rails.application.routes.draw do
  root 'podcasts#index'

  devise_for :users

  resources :podcasts do
    resources :reviews, only: [:index, :create, :edit, :update, :destroy]
  end

  resources :reviews, only: [:index, :create, :edit, :update, :destroy] do
    resources :votes, only: [:index, :create, :update]
  end

  resources :podcasts do
    resources :votes, only: [:index, :create, :update]
  end

  namespace :api do
    namespace :v1 do
      resources :podcasts do
        resources :reviews, only: [:index]
      end
      resources :reviews, only: [:index] do
        resources :users, only: [:index]
      end
    end
  end
end
