module Ecomm
  module Checkout
    class BuildCompletedOrder < BaseService
      def self.build
        new(Ecomm::Checkout::BuildOrderAddresses.build,
            Ecomm::Common::BuildLineItemsFromCart.build)
      end

      def initialize(*args)
        @build_addresses, @build_line_items = args
      end

      def call(session, customer_id)
        order_hash = session[:order]
        Order.new(customer_id: customer_id,
                  coupon_id: session[:coupon_id],
                  shipment_id: order_hash['shipment_id'],
                  subtotal: order_hash['subtotal']).tap do |order|
          order.addresses = @build_addresses.call(order_hash)
          order.credit_card = CreditCard.new(order_hash['card'])
          order.line_items = @build_line_items.call(session[:cart])
        end
      end
    end
  end
end
