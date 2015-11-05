$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'api'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'boot'

Bundler.require :default, ENV['RACK_ENV']

Dir[File.expand_path('../../api/*.rb', __FILE__)].each do |f|
  require f
end

Dir[File.expand_path('../../models/*.rb', __FILE__)].each { |f| require f }

require 'api'
require 'embryo_app'
