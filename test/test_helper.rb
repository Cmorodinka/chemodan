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

  Capybara::Screenshot.autosave_on_failure = true
  Capybara::Screenshot.prune_strategy = :keep_last_run


  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :firefox)
  end
  
  Capybara.javascript_driver = :selenium

end
