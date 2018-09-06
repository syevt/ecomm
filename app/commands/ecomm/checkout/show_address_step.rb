module Ecomm
  module Checkout
    class ShowAddressStep < BaseCommand
      def self.build
        new(Ecomm::Cart::CalculateCartTotals.build,
            Ecomm::Checkout::BuildOrder.build,
            Ecomm::Checkout::InitializeOrder.build)
      end

      def initialize(*args)
        @get_totals, @builder, @initializer = args
      end

      def call(session, _flash, customer_id)
        return publish(:denied, cart_path) if session[:cart].blank?
        totals = @get_totals.call(session)
        session[:items_total], session[:order_subtotal] = totals
        publish(:ok,
                order: @builder.call(session) ||
                       @initializer.call(session, customer_id))
      end
    end
  end
end
