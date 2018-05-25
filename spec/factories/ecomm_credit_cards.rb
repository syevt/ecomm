FactoryBot.define do
  factory :ecomm_credit_card, class: 'Ecomm::CreditCard' do
    number "MyString"
    cardholder "MyString"
    month_year "MyString"
    cvv "MyString"
    order_id 1
  end
end
