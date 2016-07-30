# Grape Embryo
[![Build Status](https://travis-ci.org/wilsonsilva/grape-embryo.svg?branch=master)](https://travis-ci.org/wilsonsilva/grape-embryo)
[![Code Climate](https://codeclimate.com/github/wilsonsilva/grape-embryo/badges/gpa.svg)](https://codeclimate.com/github/wilsonsilva/grape-embryo)
[![Test Coverage](https://codeclimate.com/github/wilsonsilva/grape-embryo/badges/coverage.svg)](https://codeclimate.com/github/wilsonsilva/grape-embryo/coverage)
[![Security](https://hakiri.io/github/wilsonsilva/grape-embryo/master.svg)](https://hakiri.io/github/wilsonsilva/grape-embryo/master)
![No monkey-patches](https://img.shields.io/badge/monkey--patches-0-brightgreen.svg)
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

[2018-05-28 15:17:47] INFO  WEBrick 1.4.2
[2018-05-28 15:17:47] INFO  ruby 2.5.1 (2018-03-29) [x86_64-darwin17]
[2018-05-28 15:17:47] INFO  WEBrick::HTTPServer#start: pid=65440 port=9292
```

## Architecture

### Goals

#### Independent of Frameworks

The architecture does not depend on the existence of some library of feature laden software.
This allows such frameworks to be used as tools, rather than having to cram the system into their limited constraints.
The business rules can be tested without the UI, Database, Web Server, or any other external element.

#### Independent of UI

The UI can change easily, without changing the rest of the system. A Web UI could be replaced with a console UI,
for example, without changing the business rules.

#### Independent of Database

It is easy to can swap out Sqlite or PostgreSQL, for Mongo, BigTable, CouchDB, or something else.
The business rules are not bound to the database.

### Organizational layers

#### Delivery

This is where the web part of the application is stored. It includes all the HTTP related logic such as headers,
redirection, status codes, JSON serialization, etc. This layer has no awareness of persistence.

* `web/[namespace]`- HTTP delivery mechanism
* `web/[namespace]api.rb` - Api route index
* `web/[namespace]app.rb` - Rack/Grape app
* `web/[namespace]/resource_api.rb` - Rack/Grape app

#### Business Logic

All business requirements of the application are contained in the `lib` folder, in a folder named after the app.
In this example our app is called `embryo`, and so is the folder. Examples of business logic:

* Verify user authorization
* Choose data to be displayed
* Determine if additional user input is required
* `lib/[namespace]` - Root folder for the application business logic
* `lib/[namespace]/models` - Active Record models
* `lib/[namespace]/operations` - Use cases of the system

#### Persistence Logic

Stores and retrieves data to achieve business requirements. Examples:

* Make an API call
* Query a local database
* Access the local filesystem

#### Utilities

* `lib/matchers` - Operation matchers
* `lib/operations` - Operation helpers
* `lib/params` - Delivery mechanism helpers
* `lib/grape` - Delivery mechanism helpers
* `spec` - Tests

## Development

* Run console: `rack-console`
* List routes `bundle exec rake routes`
* List tasks `bundle exec rake --tasks`
* Generate migration file: `bundle exec rake g:migration NAME=migration_name`
* All ActiveRecord rake tasks are accessible: `db:migrate`, `db:drop`, `db:seed`, etc

## License

See [LICENSE](https://github.com/wilsonsilva/grape-embryo/blob/master/LICENSE).
