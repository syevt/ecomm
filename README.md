# Ecomm
Ecomm is a Rails Engine that provides a shopping cart and checkout functionality to your web app to turn it into an online store.

## Installation & configuration
To start add this line to your application's Gemfile:

```ruby
gem 'ecomm', github: 'https://github.com/evtik/ecomm', branch: 'develop'
```

And then execute:
```bash
$ bundle
```
Next you will need to make a few configuration steps to put things to work.
1. Run `install` generator with:
```bash
$ rails generate ecomm:install
```
You will be asked a bunch of questions based on which you will get your Ecomm configuration saved in `config/initializers/ecomm.rb` This file may be edited afterwards if there is a need to change a particular setting. So, here they are step by step.

  1.1 The model representing a user in your app. Typically, it is `User` and that's the default option. In the initializer it adds:
  ```ruby
  config.customer_class = 'User'
  ```
  1.2 The model representing a product in your app:
  ```ruby
  config.product_class = 'Book'
  ```
  1.3 Ecomm does not have its own authentication system. It's totally your choice what to use: be it Devise, Authlogic, Clearance, Sorcery or even your custom one. You just need to provide some key points to make Ecomm use your authentication engine. First of them is the name of the method that returns the current authenticated user (if there is one) in your app. For instance, Devise's one is called `current_user` (considering the model is `User`) and that is used by default:
  ```ruby
  config.current_customer_method = 'current_user'
  ```
  1.4 Next you will have to provide the path for an unauthenticated user to sign in as any checkot process presumes existing a particular customer. The default option is Devise's `/users/sign_in`:
  ```ruby
  config.signin_path = '/users/sign_in'
  ```
  1.5 The name of the flash key which keeps the current path. This is used by your authentication engine on friendly forwarding: when an authenticated user tries to hit the page that requires authentication he will be forwarded to the sign in page first and this key holds the target page path to forward to after a successful sign in. The default one is, again, for Devise:
  ```ruby
  config.flash_login_return_to = 'user_return_to'
  ```
  1.6 The last option regarding authentication is the `I18n` key that holds the translation of the *'Authentication required'* message shown on the sign in page on friendly forwarding. The default is Devise's:
  ```ruby
  config.flash_not_authenticated_message_key = 'devise.failure.unauthenticated'
  ```
  1.7 Path to your products' catalog. Actually, it may be any path you want to forward a user after a completed checkout. This path is also used in the link on the cart page when the cart is empty. The default option is pretty arbitrary:
  ```ruby
  config.catalog_path = '/home/index'
  ```
  1.8 Ecomm mailer sends an email to the user after the order is completed. Among other details it contains a link pointing to the order detais in your app, so the user may see the order's details, totals, status, etc. This means there should exist a kind of orders controller in your app. This setting requires the appropriate route helper's name. `order_url` is used as default:
  ```ruby
  config.completed_order_url_helper_method = 'order_url'
  ```
  Once you don't feel it is necessary to include the link in the email, you may generate Ecomm views with
  ```bash
  $ rails generate ecomm:views
  ```
  and remove the order url from the order mailer's template.

2. Run the Ecomm migrations copied by the installer:
```bash
$ rails db:migrate
```
3. Ecomm presumes your `Product` model to have the following fields - `main_image`, `title`, `description` and `price` - since this is how `Product` is bound to the cart and checkout views. If you have those fields named in some other way you should set the connection with the `alias_attribute` method:
``` ruby
  class MyProduct < ApplicationRecord
    #...
    alias_attribute :main_image, :main_image_like_attribute
    alias_attribute :title, :title_like_attribute
    alias_attribute :description, :description_like_attribute
    alias_attribute :price, :price_like_attribute
    #...
  end
  ```

4. Mount the Ecomm routes with the desired path prefix, say, `/store` for instance:
```ruby
  Rails.application.routes.draw do
    # ...
    mount Ecomm::Engine => '/store'
    # ...
  end
```

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
