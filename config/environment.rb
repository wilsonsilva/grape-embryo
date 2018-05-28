ENV['RACK_ENV'] ||= 'test'

require File.expand_path('application', __dir__)

ROOT = Pathname.new(File.expand_path('..', __dir__))
Grape::ActiveRecord.database_file = ROOT.join('config', 'database.yml')
