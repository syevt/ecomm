module Ecomm
  class Order < ApplicationRecord
    # belongs_to :customer, class_name: Ecomm.user_class.to_s
    belongs_to :coupon
    belongs_to :shipment
    has_many :line_items
  end
end
