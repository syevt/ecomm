require "ecomm/engine"

module Ecomm
  CHECKOUT_STEPS = [:address, :delivery, :payment, :confirm, :complete]

  mattr_accessor :customer_class, :product_class,
                 :current_customer_method, :completed_order_url_helper_method,
                 :flash_login_return_to, :flash_not_authenticated_message_key,
                 :signin_path, :catalog_path, :session_customer_id_key

  class << self
    def customer_class
      @@customer_class.constantize
    end

    def product_class
      @@product_class.constantize
    end
  end
end
