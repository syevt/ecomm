$:.push File.expand_path("../lib", __FILE__)

require 'ecomm/version'

Gem::Specification.new do |s|
  s.name        = 'ecomm'
  s.version     = Ecomm::VERSION
  s.authors     = ['Serhiy Yevtushenko']
  s.email       = ['serhiy.yevtushenko@gmail.com']
  s.homepage    = 'http://github.com/evtik/ecomm'
  s.summary     = 'Cart/Checkout Rails Engine'
  s.description = 'A very simple cart and checkout for an online store'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile',
                'README.md']

  s.test_files = Dir['spec/**/*']

  s.add_dependency 'hamlit'
  s.add_dependency 'hamlit-rails'
  s.add_dependency 'pg'
  s.add_dependency 'rectify'
  s.add_dependency 'wisper'
  s.add_dependency 'rails', '~> 5.1.6'

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_bot_rails'
  s.add_development_dependency 'faker'
  s.add_development_dependency 'rails-controller-testing'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'wisper-rspec'
end
