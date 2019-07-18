Rails.application.routes.draw do
  resources :recycle_center, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
