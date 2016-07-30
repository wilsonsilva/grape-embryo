$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'web'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'boot'

Bundler.require :default, ENV['RACK_ENV']

Dir[File.expand_path('../../lib/matchers/*.rb', __FILE__)].each { |f| require f }
Dir[File.expand_path('../../lib/operations/*.rb', __FILE__)].each { |f| require f }
Dir[File.expand_path('../../lib/**/*.rb', __FILE__)].each { |f| require f }

Dir[File.expand_path('../../web/params/**/*.rb', __FILE__)].each { |f| require f }
Dir[File.expand_path('../../web/**/*_api.rb', __FILE__)].each { |f| require f }
Dir[File.expand_path('../../web/**/*.rb', __FILE__)].each { |f| require f }

require 'embryo/api'
require 'embryo/app'
