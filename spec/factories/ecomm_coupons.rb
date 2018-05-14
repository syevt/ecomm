FactoryBot.define do
  factory :ecomm_coupon, class: 'Ecomm::Coupon' do
    code "MyString"
    expires "2018-05-14 23:29:46"
    discount 1
  end
end
