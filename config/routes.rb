Rails.application.routes.draw do
  root 'podcasts#index'

  devise_for :users

  resources :podcasts do
    resources :reviews, only: [:create, :edit, :update, :destroy]
  end

  resources :reviews, only: [:create, :edit, :update, :destroy] do
    resources :votes, only: [:index, :create, :update]
  end

  resources :podcasts do
    resources :votes, only: [:index, :create, :update]
  end
end
