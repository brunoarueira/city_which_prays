require 'capybara/rails'
require 'capybara/rspec'
require 'capybara/poltergeist'

Capybara.configure do |config|
  config.default_driver = :poltergeist
  config.match = :prefer_exact
end

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, js_errors: true)
end
