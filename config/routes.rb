Ecomm::Engine.routes.draw do
  resource :cart, only: [:show, :update]
end
