# Grape Embryo

A [Grape](http://github.com/ruby-grape/grape) API mounted on Rack.

## Getting Started

```
$ bundle install
$ bundle exec rake db:setup
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
* Start the server: `rackup`

## License

See [LICENSE](https://github.com/wilsonsilva/grape-embryo/blob/master/LICENSE).
