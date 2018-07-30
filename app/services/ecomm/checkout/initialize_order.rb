module Ecomm
  module Checkout
    class InitializeOrder < BaseService
      def self.build
        new(Ecomm::Common::GetOrCreateAddress.build)
      end

      def initialize(get_create_address)
        @get_create_address = get_create_address
      end

      def call(session, customer_id)
        OrderForm.new(
          billing: @get_create_address.call(session, 'billing', customer_id),
          shipping: @get_create_address.call(session, 'shipping', customer_id),
          items_total: session[:items_total],
          subtotal: session[:order_subtotal]
        ).tap { |order| session[:order] = order }
      end
    end
  end
end
