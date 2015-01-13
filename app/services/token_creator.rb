class TokenCreator
  def self.call(payload)
    secret_key = Rails.application.secrets.secret_key_base
    JWT.encode payload, secret_key
  end
end
