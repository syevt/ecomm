module Ecomm
  class CheckoutPresenter < Rectify::Presenter
    def steps
      CHECKOUT_STEPS
    end

    def previous?(step, action)
      CHECKOUT_STEPS.index(step) < CHECKOUT_STEPS.index(action)
    end

    def current?(step, action)
      CHECKOUT_STEPS.index(step) == CHECKOUT_STEPS.index(action)
    end
  end
end
