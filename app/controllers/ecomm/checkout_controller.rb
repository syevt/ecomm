module Ecomm
  class CheckoutController < ApplicationController
    include Rectify::ControllerHelpers

    before_action(:authenticate_customer)
    before_action(-> { present CheckoutPresenter.new }, only: CHECKOUT_STEPS)

    CHECKOUT_STEPS.each do |step|
      define_method(step) do
        command = "Ecomm::Checkout::Show#{step.capitalize}Step".constantize
        command.call(session, flash) do
          on(:ok) { |step_variables| expose(step_variables) }
          on(:denied) { |failure_path| redirect_to(failure_path) }
        end
      end

      next if step == CHECKOUT_STEPS.last

      define_method("submit_#{step}") do
        command = "Ecomm::Checkout::Submit#{step.capitalize}Step".constantize
        command.call(session, params, flash) do
          on(:ok) { |ok_path| redirect_to(ok_path) }
          on(:error) { |error_path| redirect_to(error_path) }
        end
      end
    end
  end
end
