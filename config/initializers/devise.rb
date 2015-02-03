Devise.setup do |config|
  require 'devise/orm/neo4j'

  config.mailer_sender = 'noreply@tuxedio.com'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.password_length = 8..128
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
  config.parent_controller = 'ApiController'
  config.allow_unconfirmed_access_for = 2.days
end
