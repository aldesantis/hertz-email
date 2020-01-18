# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'hertz/email/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'hertz-email'
  s.version     = Hertz::Email::VERSION
  s.authors     = ['Alessandro Desantis']
  s.email       = ['desa.alessandro@gmail.com']
  s.homepage    = 'https://github.com/alessandro1997/hertz-email'
  s.summary     = 'An ActionMailer courier for Hertz.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'hertz', '~> 2.0'

  s.add_development_dependency 'combustion'
  s.add_development_dependency 'coveralls'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_bot_rails'
  s.add_development_dependency 'faker'
  s.add_development_dependency 'fuubar'
  s.add_development_dependency 'gem-release'
  s.add_development_dependency 'pg', '~> 1.2'
  s.add_development_dependency 'rspec-activejob'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rubocop-rspec'
end
