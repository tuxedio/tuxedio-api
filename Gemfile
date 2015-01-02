source 'https://rubygems.org'

if %w(production test).include? ENV['RAILS_ENV']
  ruby '2.1.5'
end

gem 'active_model_serializers'
gem 'neo4j', github: 'neo4jrb/neo4j'
gem 'neo4j-will_paginate_redux', github: 'neo4jrb/neo4j-will_paginate_redux'
gem 'rails', '~> 4.1.8'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'sendgrid'
gem 'puma'
gem 'jc-validates_timeliness'
gem 'devise', github: 'plataformatec/devise'
gem 'devise-neo4j', github: 'benjackson/devise-neo4j'
gem 'rack-cors', require: 'rack/cors'
gem 'omniauth'
gem 'jwt', '1.1', github: 'progrium/ruby-jwt'
gem 'foreman'
gem 'api-pagination'

group :test do
  gem 'codeclimate-test-reporter', require: nil
  gem 'rspec_api_helpers', github: 'sweatshirtio/rspec_api_helpers'
end

group :development do
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'rb-fchange', require: false
  gem 'rb-fsevent', require: false
  gem 'rb-inotify', require: false
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'rspec-collection_matchers'
  gem 'rspec-rails'
end

group :production do
  gem 'rails_12factor'
end
