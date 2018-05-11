$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require 'ecomm/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'ecomm'
  s.version     = Ecomm::VERSION
  s.authors     = ['Serhiy Yevtushenko']
  s.email       = ['serhiy.yevtushenko@gmail.com']
  s.homepage    = 'TODO'
  s.summary     = 'TODO: Summary of Ecomm.'
  s.description = 'TODO: Description of Ecomm.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile',
                'README.md']

  s.test_files = Dir['spec/**/*']

  s.add_dependency 'rails', '~> 5.1.6'

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory-girl-rails'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'sqlite3'
end
