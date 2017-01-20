Rails.application.routes.draw do
  root 'podcasts#index'

  devise_for :users
  resources :podcasts
end
