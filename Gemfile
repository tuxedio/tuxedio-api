source 'https://rubygems.org'

ruby '2.1.3'

gem "devise-neo4j", github: 'benjackson/devise-neo4j'
gem 'neo4j',        github: 'andreasronge/neo4j'
gem 'rails', '4.1.6'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'sendgrid'
gem 'thin'

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
  gem 'rspec-rails'
  gem 'rspec-collection_matchers'
end
