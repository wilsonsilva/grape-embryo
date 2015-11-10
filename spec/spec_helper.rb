require 'rubygems'

ENV['RACK_ENV'] ||= 'test'

require 'rack/test'
require 'airborne'

require File.expand_path('../../config/environment', __FILE__)

ActiveRecord::Base.logger = nil

RSpec.configure do |config|
  config.mock_with :rspec
  config.expect_with :rspec
  config.raise_errors_for_deprecations!
  config.rack_app = Embryo::App.instance

  config.include(Shoulda::Matchers::ActiveModel, type: :model)
  config.include(Shoulda::Matchers::ActiveRecord, type: :model)
end