Rails.application.routes.draw do
  root "podcasts#index"

  resources :podcasts, only: [:index, :show, :new, :create]
end
