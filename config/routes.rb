Rails.application.routes.draw do
  devise_for :users
  resources :podcasts, only: [:index, :show, :new, :create]
  resources :users, only: [:show, :new, :create]
end
