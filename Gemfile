source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'better_errors', '~> 2.4.0' # Replaces the standard Rails error page with a much better and more useful error page
gem 'binding_of_caller', '~> 0.8.0' # Retrieve the binding of a method's caller in MRI (>= 1.9.2) and RBX (Rubinius)
gem 'bootsnap', '>= 1.1.0', require: false # Boot large Ruby/Rails apps faster
gem 'brakeman', '~> 4.3.1', require: false # A static analysis security vulnerability scanner
gem 'bundler-audit', '~> 0.6.0' # Patch-level verification for Bundler
gem 'fasterer', '~> 0.4.1' # Don't make your Rubies go fast. Make them go fasterer
gem 'overcommit', '~> 0.46.0' # A fully configurable and extendable Git hook manager
gem 'puma', '~> 3.11' # A Ruby/Rack web server built for concurrency
gem 'rails', '~> 5.2.1' # Web-application framework
gem 'rails_best_practices', '~> 1.19.3' # a code metric tool for rails projects
gem 'reek', '~> 5.0.2' # Code smell detector for Ruby
gem 'rubocop-rspec', '~> 1.29.1' # RSpec-specific analysis for your projects

group :development, :test do
  gem 'dotenv-rails', '~> 2.5.0' # Shim to load environment variables from .env into ENV in development.
  gem 'factory_bot_rails', '~> 4.11.0' # Fixtures replacement
  gem 'pry-rails', '~> 0.3.6' # Debugger
  gem 'rspec-rails', '~> 3.7' # Testing framework for Rails 3.x, 4.x and 5.x
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2' # The Listen gem listens to file modifications and notifies you about the changes.
  gem 'rubocop', '~> 0.59.1' # A Ruby static code analyzer and formatter, based on the community Ruby style guide.
  gem 'spring', '~> 2.0.2' # Rails application preloader
  gem 'spring-watcher-listen', '~> 2.0.0' # Watch the filesystem for changes rather than by polling the filesystem.
end

group :test do
  gem 'capybara', '>= 2.15' # Acceptance test framework
  gem 'chromedriver-helper', '~> 1.2.0' # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'selenium-webdriver', '~> 3.14.0' # Tool for writing automated tests
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby] # Data from the IANA Time Zone database.
