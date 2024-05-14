# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'

gem 'rails', '~> 6.1'

gem 'pg', '~> 1.5'
gem 'puma', '~> 5.6'

# View related gems
gem 'jbuilder', '~> 2.9'
gem 'jquery-rails', '4.4.0'
gem 'sass-rails', '~> 6.0'
gem 'uglifier', '~> 4.2'

gem 'react-rails', '2.6.1'

gem 'bootstrap-sass', '~> 3.4.1'
gem 'font-awesome-rails', '~> 4.7'

gem 'correios-cep', '0.8.0'

group :production do
  gem 'rails_12factor', '0.0.3'
end

group :development do
  # Spring speeds up development by keeping your application running in the
  # background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  gem 'factory_bot_rails', '~> 5.1'
  gem 'rspec-rails', '~> 4.0'
  gem 'rubocop', '~> 0.76', require: false
  gem 'rubocop-rails', require: false
end

group :test do
  gem 'capybara', '3.22.0'
  gem 'poltergeist', '1.18.1'
  gem 'shoulda-matchers', '~> 4.2'
end
