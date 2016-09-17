require 'rom'
require 'yaml'

ENV['RACK_ENV'] ||= 'development'

db_config = YAML::load(IO.read('config/database.yml'))
ROMConnection = ROM.container(:sql, "sqlite://#{db_config.dig(ENV['RACK_ENV'], 'database')}")
