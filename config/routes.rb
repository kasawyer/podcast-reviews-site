Rails.application.routes.draw do
  resources :podcasts, only: [:index, :show, :new, :create]
end
