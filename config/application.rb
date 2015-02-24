require File.expand_path('../boot', __FILE__)

require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'neo4j/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TuxedioApi
  class Application < Rails::Application
    if ENV['NEO4J_PORT_7474_TCP']
      ENV['NEO4J_URL'] = ENV['NEO4J_PORT_7474_TCP'].gsub(/tcp/, 'http')
      sleep 5
    end

    config.neo4j.session_type = :server_db
    config.neo4j.session_path = ENV['NEO4J_URL'] || 'http://localhost:7474'

    config.generators do |g|
      g.orm :neo4j
      g.test_framework(
        :rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: false,
        request_specs: false
      )
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end

    %w(app lib).each do |folder|
      config.autoload_paths << Rails.root.join(folder)
    end
  end
end
