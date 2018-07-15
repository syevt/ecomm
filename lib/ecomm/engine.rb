require 'bootstrap-sass'
require 'countries/global'
require 'draper'
require 'font-awesome-rails'
require 'hamlit'
require 'i18n-js'
require 'jquery-rails'
require 'rectify'
require 'sass-rails'
require 'wisper'

if Rails.env == 'test'
  require 'carrierwave'
  require 'devise'
end

module Ecomm
  class Engine < ::Rails::Engine
    isolate_namespace Ecomm

    config.generators do |g|
      g.test_framework      :rspec,        fixture: false
      g.fixture_replacement :factory_bot
      g.factory_bot dir: 'spec/factories'
      g.assets false
      g.helper false
    end
  end
end
