Ecomm::Engine.routes.draw do
  root to: 'cart#show'

  resource :cart, only: [:show, :update]
  resources :cart_items, only: [:create, :destroy]

  scope 'checkout' do
    Ecomm::CHECKOUT_STEPS.each do |action|
      get action, to: "checkout##{action}", as: "checkout_#{action}"

      next if action == Ecomm::CHECKOUT_STEPS.last

      post action, to: "checkout#submit_#{action}",
                   as: "checkout_submit_#{action}"
    end
  end
end
