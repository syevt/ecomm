Ecomm::Engine.routes.draw do
  root to: 'cart#show'

  resource :cart, only: [:show, :update]
  resources :cart_items, only: [:create, :destroy]
end
