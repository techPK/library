source 'https://rubygems.org'

gem 'rails', '3.2.8'
gem 'bootstrap-sass', '~> 2.0.4.0' #Added first edit

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'
gem 'thin'  #Added first edit

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'execjs'  #Added first edit
  gem 'therubyracer', :platforms => :ruby   #Uncommented first edit
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use debugger
# gem 'debugger'
# group :development do #Added first edit
  gem 'haml-rails'
  gem 'hpricot'
  gem 'ruby_parser'
# end

group :development, :test do #Added first edit
  gem "rspec-rails", "~> 2.10.1"  # includes RSpec with some extra Rails-specific features
  gem "factory_girl_rails", "~> 3.2.0" # replaces Rails’ default fixtures for feeding test data
  gem "guard-rspec", "~> 0.7.0" # auto runs tests and runs specs when code changes.
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem "foreman", "~> 0.51.0"
end

group :test do
  gem "faker", "~> 1.0.1" # generates valid data for tests.
  gem "capybara", "~> 1.1.2"  # programmatically simulates your users’ web interactions.
  gem "database_cleaner", "~> 0.7.2"  # cleans data from the test database
  gem "launchy", "~> 2.1.0" # render the test in the web browser on-demand
end
