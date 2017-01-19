Rails.application.routes.draw do

  root 'podcasts#index'

  devise_for :users
  resources :podcasts, only: [:index, :show, :new, :create]
end
