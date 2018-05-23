module Ecomm
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    helper_method :current_customer

    def current_customer
      send(Ecomm.current_customer_method)
    end

    private

    def authenticate_customer
      return unless current_customer
      session[Ecomm.flash_login_return_to] = request.fullpath
      flash.alert = 'need to add this to i18n locale or ref to Devise`s'
      redirect_to(Ecomm.signin_path)
    end
  end
end
