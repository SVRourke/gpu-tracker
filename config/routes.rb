Rails.application.routes.draw do
  resources :cards, only: [:index, :show]
  resources :merchants, only: [:index, :show]

  # routes for uodating service
end
