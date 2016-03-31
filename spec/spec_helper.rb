ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'rspec/rails'
require 'capybara/rspec'
require 'selenium-webdriver'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  Capybara.default_max_wait_time = 60

  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :firefox)
  end
  
  Capybara.javascript_driver = :selenium
  Dir[Rails.root.join("spec/support/*.rb")].each { |f| require f }

  RSpec.configure do |config|
    config.before { allow($stdout).to receive(:puts) } # allow puts inside rspec test - just for better understanding what has happened wrong
    config.include WaitForAjax, type: :feature
  end
end
