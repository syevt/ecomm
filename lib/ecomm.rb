require "ecomm/engine"

module Ecomm
  CHECKOUT_STEPS = [:address, :delivery, :payment, :confirm, :complete]

  mattr_accessor :customer_class, :product_class,
                 :current_customer_method, :flash_login_return_to,
                 :signin_path

  class << self
    def customer_class
      @@customer_class.constantize
    end

    def product_class
      @@product_class.constantize
    end
  end
end
