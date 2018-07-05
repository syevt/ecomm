module Ecomm
  module Checkout
    class ShowConfirmStep < BaseCommand
      def self.build
        new(Checkout::BuildOrder.build, Common::BuildLineItemsFromCart.build)
      end

      def initialize(*args)
        @builder, @line_items_builder = args
      end

      def call(session, *_args)
        order = @builder.call(session)
        return publish(:denied, checkout_payment_path) unless order&.card
        order.credit_card = CreditCard.new(order.card.to_h).decorate
        publish(
          :ok,
          order: order,
          billing: order.billing,
          shipping: order.use_billing ? order.billing : order.shipping,
          line_items: @line_items_builder.call(session[:cart])
        )
      end
    end
  end
end
