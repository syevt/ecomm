require "ecomm/engine"

module Ecomm
  CHECKOUT_STEPS = [:address, :delivery, :payment, :confirm, :complete]

  mattr_accessor :customer_class
  mattr_accessor :product_class

  class << self
    def customer_class
      @@customer_class.constantize
    end

    def product_class
      @@product_class.constantize
    end
  end
end
