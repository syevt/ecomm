ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../dummy/config/environment.rb',  __FILE__)
require 'rails-controller-testing'
require 'rspec/rails'
require 'faker'
require 'wisper/rspec/matchers'

Rails.backtrace_cleaner.remove_silencers!

Dir["#{File.dirname(__FILE__)}/../spec/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_fixtures = false
  config.infer_base_class_for_anonymous_controllers = false
  config.order = 'random'
  config.include Wisper::RSpec::BroadcastMatcher
  config.include AbstractController::Translation
end
