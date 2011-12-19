ENV['RACK_ENV'] = "test"
require  ::File.expand_path(::File.dirname(__FILE__) + '../../lib/millibot/server')

Bundler.setup(:default, :test)

require 'rspec'
require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec'

RSpec.configure do |config|
  
  config.before(:each) do
    Capybara.app = ::Millibot::Server.new
  end
  
  config.include Capybara::DSL
end