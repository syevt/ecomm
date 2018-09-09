module Ecomm
  module Cart
    class HandleCoupon < BaseCommand
      def self.build
        new(Ecomm::Cart::GetCouponError.build)
      end

      def initialize(get_coupon_error)
        @get_coupon_error = get_coupon_error
      end

      def call(coupon_code)
        coupon = Coupon.find_by(code: coupon_code)
        coupon_states = coupon.nil? ? [true] : [false, coupon&.order.present?]
        coupon_states << (coupon.expires < Date.today) if coupon_states.none?
        if coupon_states.any?
          publish(:error, @get_coupon_error.call(coupon_states))
        else
          publish(:ok, coupon)
        end
      end
    end
  end
end
