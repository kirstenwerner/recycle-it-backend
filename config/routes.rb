Rails.application.routes.draw do
  resources :recycle_center, only: [:index]
  resources :materials, only: [:index]
end
