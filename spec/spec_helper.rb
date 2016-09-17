require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

require 'rubygems'
require 'rack/test'
require 'airborne'
require 'factory_girl'
require 'rom_factory'
require 'pry'

ENV['RACK_ENV'] = 'test'

require File.expand_path('../../config/environment', __FILE__)

ActiveRecord::Base.logger = nil

DatabaseCleaner[:sequel, connection: ROMConnection.gateways[:default].connection].strategy = :truncation

RomFactory::Config.configure do |config|
  config.container = ROMConnection
end

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.mock_with :rspec
  config.expect_with :rspec
  config.raise_errors_for_deprecations!
  config.rack_app = Embryo::App.instance

  config.include FactoryGirl::Syntax::Methods
  config.include RomFactory::Syntax::Methods

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
