# Tuxedio API

[![Circle CI](https://circleci.com/gh/tuxedio/tuxedio-api.svg?style=shield)](https://circleci.com/gh/tuxedio/tuxedio-api)
[![Code Climate](https://codeclimate.com/github/tuxedio/tuxedio-api/badges/gpa.svg)](https://codeclimate.com/github/tuxedio/tuxedio-api)
[![Test Coverage](https://codeclimate.com/github/tuxedio/tuxedio-api/badges/coverage.svg)](https://codeclimate.com/github/tuxedio/tuxedio-api)
![Stories in Ready](https://badge.waffle.io/tuxedio/tuxedio-api.png?label=ready&title=Ready)

REST API for the Tuxedio experience marketplace.

## Setup

1. Install [Neo4j](http://neo4j.com/docs/stable/server-installation.html)
  * Note: make sure to start the Neo4j server
2. Install mailcatcher gem and run the daemon
  `$ gem install mailcatcher && mailcatcher`
3. Install the bundles
  `$ bundle install`
4. Run the tests
  `$ rspec`

## Coding Style

1. "Make everything as simple as possible, but not simpler."
2. Keep in line with the [Ruby style guide](https://github.com/bbatsov/ruby-style-guide)
  - The CI Suite has rubocop, so run it: `$ bundle exec rubocop`.
