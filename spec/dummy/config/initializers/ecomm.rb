# Models
Ecomm.customer_class = 'Member'
Ecomm.product_class = 'RawProduct'

# Authentication
Ecomm.current_customer_method = 'current_member'
Ecomm.flash_login_return_to = 'member_return_to' # or user_return_to ???
Ecomm.flash_not_authenticated_message_key = 'devise.failure.unauthenticated'
Ecomm.signin_path = '/members/sign_in'
Ecomm.session_customer_id_key = "['warden.user.member.key'][0][0]"
