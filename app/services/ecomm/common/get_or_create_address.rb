module Ecomm
  module Common
    class GetOrCreateAddress < BaseService
      def self.build
        new(Checkout::GetAddressFromSession)
      end

      def initialize(get_address_from_session)
        @get_address_from_session = get_address_from_session
      end

      def call(session, address_type)
        address_exists = session[:address] &&
                         session[:address]['address_type'] == address_type
        return @get_address_from_session.call(session) if address_exists
        customer_id = Ecomm.get_customer_id(session)
        address = Address.find_by(customer_id: customer_id,
                                  address_type: address_type)
        return AddressForm.from_model(address) if address
        AddressForm.new(address_type: address_type)
      end
    end
  end
end
