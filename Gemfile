source 'https://rubygems.org'

ruby '2.1.4'

gem 'neo4j', github: 'neo4jrb/neo4j'
gem 'rails'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'sendgrid'
gem 'thin'
gem 'jc-validates_timeliness'
gem 'devise', github: 'plataformatec/devise'
gem 'devise-neo4j', github: 'benjackson/devise-neo4j'
gem 'rack-cors', require: 'rack/cors'
gem 'simple_token_authentication', github: 'tuxedio/simple_token_authentication'
gem 'omniauth'
gem 'jwt', '1.1', github: 'progrium/ruby-jwt'

group :test do
  gem 'rspec_api_helpers', github: 'sweatshirtio/rspec_api_helpers'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_21]
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
  gem 'spring'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'pry-byebug', github: 'deivid-rodriguez/pry-byebug'
  gem 'rspec-collection_matchers'
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
end
