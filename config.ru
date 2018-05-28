require File.expand_path('config/environment', __dir__)

use ActiveRecord::ConnectionAdapters::ConnectionManagement

run Embryo::App.instance
