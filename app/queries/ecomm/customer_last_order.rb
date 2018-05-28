module Ecomm
  class CustomerLastOrder < Rectify::Query
    def initialize(customer_id)
      @customer_id = customer_id
    end

    def query
      Order.where(customer_id: @customer_id)
           .order('ecomm_orders.created_at DESC')
           .includes(:billing_address, :credit_card, :shipment, :coupon,
                     line_items: [:product])
    end
  end
end
