require "ecomm/engine"

module Ecomm
  CHECKOUT_STEPS = [:address, :delivery, :payment, :confirm, :complete]

  mattr_accessor :product_class

  def self.product_class
    @@product_class.constantize
  end
end
