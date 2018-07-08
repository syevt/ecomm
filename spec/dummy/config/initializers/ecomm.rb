Ecomm.setup do |config|
  config.checkout_steps = [:address, :delivery, :payment, :confirm, :complete]

  # Models
  config.customer_class = 'Member'
  config.product_class = 'RawProduct'

  # Authentication
  config.current_customer_method = 'current_member'
  config.flash_login_return_to = 'member_return_to' # or user_return_to ???
  config.flash_not_authenticated_message_key = 'devise.failure.unauthenticated'

  # Paths & urls
  config.signin_path = '/members/sign_in'
  config.catalog_path = '/home/index'
  config.completed_order_url_helper_method = 'order_url'
end
