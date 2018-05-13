require "ecomm/engine"

module Ecomm
  mattr_accessor :product_class

  def self.product_class
    @@product_class.constantize
  end
end
