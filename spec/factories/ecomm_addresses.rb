FactoryBot.define do
  factory :ecomm_address, class: 'Ecomm::Address' do
    customer_id 1
    order_id 1
    first_name "MyString"
    last_name "MyString"
    street_address "MyString"
    city "MyString"
    zip "MyString"
    country "MyString"
    phone "MyString"
    address_type "MyString"
  end
end
