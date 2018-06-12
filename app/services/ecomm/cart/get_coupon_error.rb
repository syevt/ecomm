module Ecomm
  module Cart
    class GetCouponError < BaseService
      include AbstractController::Translation

      def call(coupon_states)
        {
          [true, false] => t('ecomm.coupon.non_existent'),
          [false, true] => t('ecomm.coupon.taken'),
          [false, false, true] => t('ecomm.coupon.expired')
        }[coupon_states]
      end
    end
  end
end
