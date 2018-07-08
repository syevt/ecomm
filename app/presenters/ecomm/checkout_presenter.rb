module Ecomm
  class CheckoutPresenter < Rectify::Presenter
    def steps
      Ecomm.checkout_steps
    end

    def previous?(step, action)
      steps.index(step) < steps.index(action.to_sym)
    end

    def current?(step, action)
      steps.index(step) == steps.index(action.to_sym)
    end
  end
end
