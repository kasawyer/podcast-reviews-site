Rails.application.routes.draw do
  devise_for :admins
  root 'podcasts#index'

  devise_for :users

  resources :podcasts do
    resources :reviews, only: [:index, :create]
  end

  namespace :api do
    namespace :v1 do
      resources :podcasts do
        resources :reviews, only: [:index, :destroy]
      end
      resources :reviews, only: [:index, :update] do
        get 'total_votes'
        resources :users, only: [:index]
        resources :votes, only: [:create]
      end
    end
  end
end
