source 'https://rubygems.org'

ruby '2.2.0'

gem 'active_model_serializers'
gem 'api-pagination'
gem 'devise', github: 'plataformatec/devise'
gem 'devise-neo4j', github: 'benjackson/devise-neo4j'
gem 'foreman'
gem 'jc-validates_timeliness'
gem 'jwt', '1.1', github: 'progrium/ruby-jwt'
gem 'neo4j', github: 'neo4jrb/neo4j'
gem 'neo4j-will_paginate_redux', github: 'neo4jrb/neo4j-will_paginate_redux'
gem 'omniauth'
gem 'puma'
gem 'rack-cors', require: 'rack/cors'
gem 'rails', '~> 4.1.8'

group :test do
  gem 'codeclimate-test-reporter', require: nil
  gem 'rspec_api_helpers', github: 'sweatshirtio/rspec_api_helpers'
end

group :development do
  gem 'rubocop', require: false
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
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
