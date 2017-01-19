Rails.application.routes.draw do
  root 'podcasts#index'

  devise_for :users
  resources :podcasts, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:create, :edit, :update, :delete]
  end
end
