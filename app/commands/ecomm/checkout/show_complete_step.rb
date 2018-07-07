module Ecomm
  module Checkout
    class ShowCompleteStep < BaseCommand
      def self.build
        new(Ecomm::CustomerLastOrder)
      end

      def initialize(last_order_query)
        @last_order_query = last_order_query
      end

      def call(_session, flash, customer_id)
        return publish(:denied, cart_path) unless flash[:order_confirmed]
        flash.keep
        order = @last_order_query.new(customer_id).first.decorate
        publish(:ok, order: order, line_items: order.line_items)
      end
    end
  end
end
