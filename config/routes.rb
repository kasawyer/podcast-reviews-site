Rails.application.routes.draw do
  devise_for :admins
  root 'podcasts#index'

  devise_for :users

  resources :podcasts do
    resources :reviews, only: [:create, :edit, :update, :destroy]
  end

end
