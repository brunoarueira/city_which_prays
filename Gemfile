# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.3.10'

gem 'rails', '~> 7.2', '>= 7.2.3.1'

gem 'pg', '~> 1.5'
gem 'puma', '~> 7.2'

# View related gems
gem 'jbuilder', '~> 2.9'
gem 'jquery-rails', '4.4.0'
gem 'sass-rails', '~> 6.0'
gem 'uglifier', '~> 4.2'

gem 'react-rails', '~> 3.3'

gem 'bootstrap-sass', '~> 3.4.1'
gem 'font-awesome-rails', '~> 4.7'

gem 'via_cep', github: 'marcelobarreto/via_cep', ref: '9b7cebe'

group :production do
  gem 'rails_12factor', '0.0.3'
end

group :development, :test do
  gem 'factory_bot_rails', '~> 5.1'
  gem 'rspec-rails', '~> 7.1'
  gem 'rubocop', '~> 0.76', require: false
  gem 'rubocop-rails', require: false
end

group :test do
  gem 'capybara', '3.40.0'
  gem 'poltergeist', '1.18.1'
  gem 'shoulda-matchers', '~> 4.2'
end
