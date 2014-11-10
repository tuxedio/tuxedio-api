source 'https://rubygems.org'

ruby '2.1.4'

gem 'neo4j',        github: 'andreasronge/neo4j'
gem 'rails'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'sendgrid'
gem 'thin'
gem 'jc-validates_timeliness'
gem 'devise_token_auth', github: 'tuxedio/devise_token_auth',
  branch: 'remove-ar-dependency'
gem 'devise-neo4j', github: 'benjackson/devise-neo4j'
gem 'omniauth'

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
  gem 'rspec-collection_matchers'
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
end
