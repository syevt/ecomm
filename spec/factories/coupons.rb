FactoryBot.define do
  factory :coupon, class: 'Ecomm::Coupon' do
    code '123456'
    expires Date.today
    discount 10
  end
end
