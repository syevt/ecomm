Rails.application.routes.draw do
  root to: 'home#index'

  get 'home/index'

  mount Ecomm::Engine => "/ecomm"
end
