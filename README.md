# Tax Calculator

## Getting Started

### Installing

To up and running this app, you will need:

* Docker
* docker-compose

Create file .env and set the environment variable like below:

```
# Development
DEVELOPMENT_DATABASE=tax_calculator_development
DEVELOPMENT_USERNAME=postgres
DEVELOPMENT_PASSWORD=123456

# Test
TEST_DATABASE=tax_calculator_test
TEST_USERNAME=postgres
TEST_PASSWORD=123456

# General
DB_HOST=localhost # This is for running in localhost
DB_HOST=db # This is for running in docker
```

And then run using:

```
$ docker-compose up
```

The server will run at [localhost:3000](http://localhost:3000)

## Running the tests

### [RSpec](https://github.com/rspec/rspec-rails)

Testing framework for Rails 3.x, 4.x and 5.x.

Use the `rspec` command to run your specs:

```
$ bundle exec rspec
```

To run only a subset of these specs use the following command:

```
# Run only model specs
$ bundle exec rspec spec/models

# Run only specs for AccountsController
$ bundle exec rspec spec/controllers/accounts_controller_spec.rb

# Run only spec on line 8 of AccountsController
$ bundle exec rspec spec/controllers/accounts_controller_spec.rb:8
```

### [Brakeman](https://github.com/presidentbeef/brakeman)

Brakeman is a static analysis tool which checks Ruby on Rails applications for security vulnerabilities.

```
$ brakeman
```

### [bundler-audit](https://github.com/rubysec/bundler-audit)

Patch-level verification for bundler.

Use the `bundle audit` command to run bundler-audit

```
$ bundle audit
```

### [Fasterer](https://github.com/DamirSvrtan/fasterer)

Make your Rubies go faster

Use the `fasterer` command to run fasterer

```
$ fasterer
```

### [rails_best_practices](https://github.com/flyerhzm/rails_best_practices)

rails_best_practices is a code metric tool to check the quality of Rails code.

Use the `rails_best_practices` command to run rails_best_practices

```
$ rails_best_practices
```

### [Reek](https://github.com/troessner/reek)

Code smell detector for Ruby

Use the `reek` command to run reek

```
$ reek
```

### [RuboCop](https://github.com/rubocop-hq/rubocop)

Ruby static code analyzer and code formatter

Use the `rubocop` command to run rubocop

```
$ rubocop
```

### All in one

To running all the tests, you can run command:

```
$ rake code_analyzer:all
```

## List of Gems

* [overcommit](https://github.com/brigade/overcommit) - A fully configurable and extendable Git hook manager
* [dotenv](https://github.com/bkeepers/dotenv) - Shim to load environment variables from .env into ENV in development.
* [factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails) - is a fixtures replacement with a straightforward definition syntax, support for multiple build strategies (saved instances, unsaved instances, attribute hashes, and stubbed objects), and support for multiple factories for the same class (user, admin_user, and so on), including factory inheritance.
* [rspec-rails](https://github.com/rspec/rspec-rails) - rspec-rails is a testing framework for Rails 3.x, 4.x and 5.x.
* [Better Errors](https://github.com/charliesome/better_errors) - Better Errors replaces the standard Rails error page with a much better and more useful error page
* [Brakeman](https://github.com/presidentbeef/brakeman) - Brakeman is a static analysis tool which checks Ruby on Rails applications for security vulnerabilities.
* [bundler-audit](https://github.com/rubysec/bundler-audit) - Patch-level verification for bundler.
* [Fasterer](https://github.com/DamirSvrtan/fasterer) - Make your Rubies go faster
* [pry-rails](https://github.com/rweng/pry-rails) - Avoid repeating yourself, use pry-rails instead of copying the initializer to every rails project.
* [rails_best_practices](https://github.com/flyerhzm/rails_best_practices) - rails_best_practices is a code metric tool to check the quality of Rails code.
* [Reek](https://github.com/troessner/reek) - Code smell detector for Ruby
* [RuboCop](https://github.com/rubocop-hq/rubocop) - RuboCop is a Ruby static code analyzer and code formatter
