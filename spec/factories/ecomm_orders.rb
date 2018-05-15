FactoryBot.define do
  factory :ecomm_order, class: 'Ecomm::Order' do
    user_id 1
    shipment_id 1
    coupon_id 1
    state "MyString"
    subtotal "9.99"
  end
end
