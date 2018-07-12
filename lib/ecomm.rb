require 'ecomm/engine'

module Ecomm
  mattr_accessor :checkout_steps, :customer_class, :product_class,
                 :current_customer_method, :completed_order_url_helper_method,
                 :flash_login_return_to, :flash_not_authenticated_message_key,
                 :signin_path, :catalog_path

  @@checkout_steps = [:address, :delivery, :payment, :confirm, :complete]

  class << self
    def customer_class
      @@customer_class.constantize
    end

    def product_class
      @@product_class.constantize
    end

    def setup
      yield self
    end
  end
end
