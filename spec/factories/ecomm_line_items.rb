FactoryBot.define do
  factory :ecomm_line_item, class: 'Ecomm::LineItem' do
    product_id 1
    order_id 1
    quantity 1
  end
end
