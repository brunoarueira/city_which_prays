# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.7.0'

gem 'rails', '~> 6.0'

gem 'pg', '~> 1.2'
gem 'puma', '~> 4.3'

# View related gems
gem 'jbuilder', '~> 2.9'
gem 'jquery-rails'
gem 'sass-rails', '~> 6.0'
gem 'uglifier', '>= 1.3.0'

gem 'react-rails', '2.6.1'
gem 'therubyracer', '0.12.3', platforms: :ruby

gem 'bootstrap-sass', '~> 3.4.1'
gem 'font-awesome-rails', '4.7.0.5'

gem 'correios-cep', '0.7.1'

group :production do
  gem 'rails_12factor', '0.0.3'
end

group :development do
  gem 'listen', '~> 3.1.5'
  gem 'web-console'

  # Spring speeds up development by keeping your application running in the
  # background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger
  # console
  gem 'byebug', platform: :mri

  gem 'factory_bot_rails', '4.11.1'
  gem 'rspec-rails', '~> 3.9'
  gem 'rubocop', '~> 0.76', require: false
  gem 'rubocop-rails', require: false
end

group :test do
  gem 'capybara', '3.22.0'
  gem 'poltergeist', '1.18.1'
  gem 'shoulda-matchers', '4.0.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
