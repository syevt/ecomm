module Ecomm
  module Common
    class GetCountries < BaseService
      def call
        Country.all.sort.map { |country| [country.name, country.country_code] }
      end
    end
  end
end
