# Grape Embryo
[![Build Status](https://travis-ci.org/wilsonsilva/grape-embryo.svg?branch=master)](https://travis-ci.org/wilsonsilva/grape-embryo)
[![Code Climate](https://codeclimate.com/github/wilsonsilva/grape-embryo/badges/gpa.svg)](https://codeclimate.com/github/wilsonsilva/grape-embryo)
[![Test Coverage](https://codeclimate.com/github/wilsonsilva/grape-embryo/badges/coverage.svg)](https://codeclimate.com/github/wilsonsilva/grape-embryo/coverage)
[![MIT license](http://img.shields.io/badge/license-MIT-brightgreen.svg)](http://opensource.org/licenses/MIT)

A [Grape](http://github.com/ruby-grape/grape) app mounted on Rack that helps you put together a RESTful API.

## Built With
* [Rack](https://github.com/rack/rack) - A minimal, modular, and adaptable interface for developing web applications
* [Grape](https://github.com/ruby-grape/grape) - Aids in creation of REST-like APIs
* [Grape-Swagger](https://github.com/ruby-grape/grape-swagger) - Adds swagger compliant documentation to the API
* [ActiveRecord](https://github.com/rails/rails/tree/master/activerecord) - An almost zero-configuration persistence
layer
* [SQLite3](https://github.com/sparklemotion/sqlite3-ruby) - An interface with the SQLite3 database engine. For
[testing purposes](https://www.sqlite.org/selfcontained.html).
* [Guard](https://github.com/guard/guard) - Automatically tests and lints the code whenever file or directories are
modified.
* [Rubocop](https://github.com/bbatsov/rubocop) - Enforces many of the guidelines outlined in the community
[Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide).
* [RSpec](https://github.com/rspec/rspec) - Provides a behaviour driven development framework
* [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers) - RSpec matchers for ActiveRecord
* [Factory Girl](https://github.com/thoughtbot/factory_girl) - A library for setting up Ruby objects as test data.
* [Airborne](https://github.com/brooklynDev/airborne) - Aids in the testing of the API
* [Database Cleaner](https://github.com/DatabaseCleaner/database_cleaner) - Ensures a clean state for testing.
* and many [others](https://github.com/wilsonsilva/grape-embryo/blob/master/Gemfile)

## Getting Started

Install the dependencies
```
$ bundle install
```

Create and populate the database
```
$ bundle exec rake db:setup
```

Start the server

```
$ rackup

[2015-11-15 09:58:59] INFO  WEBrick 1.3.1
[2015-11-15 09:58:59] INFO  ruby 2.2.3 (2015-08-18) [x86_64-darwin14]
[2015-11-15 09:58:59] INFO  WEBrick::HTTPServer#start: pid=247 port=9292
```

## Development

* Run console: `rack-console`
* List routes `bundle exec rake routes`
* List tasks `bundle exec rake --tasks`
* Generate migration file: `bundle exec rake g:migration NAME=migration_name`
* All ActiveRecord rake tasks are accessible: `db:migrate`, `db:drop`, `db:seed`, etc

## License

See [LICENSE](https://github.com/wilsonsilva/grape-embryo/blob/master/LICENSE).
