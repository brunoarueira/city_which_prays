source 'https://rubygems.org'

ruby '2.3.4'

gem 'rails', '~> 5.2.1'

gem 'pg', '~> 1.1'
gem 'puma', '~> 3.0'

# View related gems
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.7'

gem 'therubyracer', '0.12.3', platforms: :ruby
gem 'react-rails', '2.4.7'

gem 'bootstrap-sass', '~> 3.3.6'
gem 'font-awesome-rails', '4.7.0.4'

gem 'correios-cep', '0.6.8'
gem 'oga', '2.15'

group :production do
  gem 'rails_12factor', '0.0.3'
end

group :development do
  gem 'web-console'
  gem 'listen', '~> 3.1.5'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri

  gem 'rspec-rails', '~> 3.8'
  gem 'factory_girl_rails', '4.9.0'
  gem 'rails-controller-testing', '1.0.2'
end

group :test do
  gem 'shoulda-matchers', '3.1.2'
  gem 'capybara', '3.10.0'
  gem 'poltergeist', '1.18.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
