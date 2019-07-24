Rails.application.routes.draw do
  resources :materials, only: [:index, :show]
  # post"/recycle_centers", to: "recycle_centers#index"
  resources :recycle_centers, only: [:index]
  # resources :zip_long_lats
  post '/zip_long_lats', to: 'zip_long_lats#create'
end
