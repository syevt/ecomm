module Ecomm
  class InstallGenerator < Rails::Generators::Base
    desc 'Generates Ecomm initializer with settings based on user input'

    @@settings = {
      customer_class: 'User',
      product_class: 'Book',
      current_customer_method: 'current_user',
      signin_path: '/users/sign_in',
      flash_login_return_to: 'user_return_to',
      flash_not_authenticated_message_key: 'devise.failure.unauthenticated',
      catalog_path: '/home/index',
      completed_order_url_helper_method: 'order_url'
    }

    @@separator = '=' * 72

    def check_if_exists
      file_path = 'config/initializers/ecomm.rb'
      return unless File.exist?(file_path)
      prompt = <<~HEREDOC.strip
        #{@@separator}
        File config/initializers/ecomm.rb already exists! Running this generator
        will overwrite the existing config with default values. Do you really
        want to continue? (y/n):
      HEREDOC
      exit if no?(prompt, :red)
      File.delete(file_path)
    end

    def info
      message = <<~HEREDOC.strip
        #{@@separator}
        This will generate the necessary Ecomm setup based on your answers and
        put it in app/config/initializers/ecomm.rb . If there is a need to
        change some setting as you go you may just edit that file.
      HEREDOC
      say(message)
    end

    def customer_class
      prompt = <<~HEREDOC.strip
        #{@@separator}
        Enter the name of the model representing a user in your app (default is
        User):
      HEREDOC
      answer = ask(prompt)
      @@settings[:customer_class] = answer if answer.present?
    end

    def product_class
      prompt = <<~HEREDOC.strip
        #{@@separator}
        Enter the name of the model representing a product in your app (default
        is Book):
      HEREDOC
      answer = ask(prompt)
      @@settings[:product_class] = answer if answer.present?
    end

    def current_customer_method
      prompt = <<~HEREDOC.strip
        #{@@separator}
        Enter the name of your authentication engine`s helper method which
        returns the current authenticated user
        (default is Devise`s current_user):
      HEREDOC
      answer = ask(prompt)
      @@settings[:current_customer_method] = answer if answer.present?
    end

    def signin_path
      prompt = <<~HEREDOC.strip
        #{@@separator}
        Provide the authentication path (default is Devise`s /users/sign_in):
      HEREDOC
      answer = ask(prompt)
      @@settings[:signin_path] = answer if answer.present?
    end

    def catalog_path
      prompt = <<~HEREDOC.strip
        #{@@separator}
        Enter the path you want to be a general path to your products` catalog
        (required as a return path from the checkout and used in the emtpy cart
        message, default is arbitrary /home/index):
      HEREDOC
      answer = ask(prompt)
      @@settings[:catalog_path] = answer if answer.present?
    end

    def flash_login_return_to
      prompt = <<~HEREDOC.strip
        #{@@separator}
        Enter the flash key that holds a target path used in friendly forwarding
        (i.e. the path that an unauthenticated user tried to reach before being
        authenticated, default is Devise`s user_return_to):
      HEREDOC
      answer = ask(prompt)
      @@settings[:flash_login_return_to] = answer if answer.present?
    end

    def flash_not_authenticated_message_key
      prompt = <<~HEREDOC.strip
        #{@@separator}
        Enter your authentication engine`s I18n translation key that holds the
        'authentication required' message typically shown from flash
        (default is Devise`s devise.failure.unauthenticated):
      HEREDOC
      answer = ask(prompt)
      @@settings[:flash_not_authenticated_message_key] = answer if answer.present?
    end

    def completed_order_url_helper_method
      prompt = <<~HEREDOC.strip
        #{@@separator}
        Provide the url helper method which will be used by the order mailer to
        put a link to that order in an email. This assumes that you have some
        orders controller in your app that shows a user`s orders. In a case you
        don`t need this there is a possibility to generate Ecomm views with
        'rails generate ecomm:views' and completely remove the link from the
        mailer template.
        (default is some arbitrary order_url):
      HEREDOC
      answer = ask(prompt)
      @@settings[:completed_order_url_helper_method] = answer if answer.present?
    end

    def create_initializer
      File.open('config/initializers/ecomm.rb', 'w') do |file|
        file << 'Ecomm.setup do |config|'

        @@settings.each do |key, value|
          file << "\n  config.#{key} = '#{value}'"
        end

        file << "\nend"
      end
    end
  end
end
