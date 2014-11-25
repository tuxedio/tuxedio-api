[![Stories in Ready](https://badge.waffle.io/tuxedio/tuxedio-api.png?label=ready&title=Ready)](https://waffle.io/tuxedio/tuxedio-api)
Tuxedo
======


###Workflow
  1. Pull remote changes
    - Use naming convention f-<featurename> for creating feature branches, c-<name> for chores
  2. Do development in feature branch
  3. Make sure you pass the tests and the feature does not break any other features
  4. Push the feature branch to github (git push origin f-<featurename>)
  5. Make a Pull request to merge back into development branch.


###Setup:
```
  $ brew install postgresql
  $ bundle install
  $ rake db:create db:migrate db:populate
  $ RAILS_ENV='test' rake db:create db:migrate db:populate
```


###Coding Style:
  1. "Make everything as simple as possible, but not simpler."
  2. Try to stay consistent in coding styles
  3. Use 2 spaces for tabbing
  4. Align characters when possible. (tip: use a monospaced font like Inconsolata)
  5. Naming conventions:
    - Methods:   snake_case
    - Classes:   CamelCase
    - Constants: SCREAMING_SNAKE_CASE
  6. Comment about WHAT your code does, not HOW. If someone else can't understand the logic, you might want to refactor your code...
