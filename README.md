![Stories in Ready](https://badge.waffle.io/tuxedio/tuxedio-api.png?label=ready&title=Ready) [![Circle CI](https://circleci.com/gh/tuxedio/tuxedio-api.svg?style=svg)](https://circleci.com/gh/tuxedio/tuxedio-api)

Tuxedio API
===========

REST API for the Tuxedio experience marketplace.

### Workflow
  1. Pull remote changes
    - Use naming convention f-<featurename> for creating feature branches, c-<name> for chores
  2. Do development in feature branch
  3. Make sure you pass the tests and the feature does not break any other features
  4. Push the feature branch to github (git push origin f-<featurename>)
  5. Make a Pull request to merge back into development branch.

### Setup:
  1. Install [Neo4j](http://neo4j.com/docs/stable/server-installation.html)
    * Note: make sure to start the Neo4j server
  2. Install the bundles
    `$ bundle install`
  3. Run the tests
    `$ rspec`

### Coding Style:
  1. "Make everything as simple as possible, but not simpler."
  2. When possible, keep in line with the [Ruby style guide](https://github.com/bbatsov/ruby-style-guide)
