ENV['RACK_ENV'] ||= 'test'

require File.expand_path('../application', __FILE__)

ROOT = Pathname.new(File.expand_path('../..', __FILE__))
Grape::ActiveRecord.database_file = ROOT.join('config', 'database.yml')
