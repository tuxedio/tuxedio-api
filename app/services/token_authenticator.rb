class TokenAuthenticator
  def self.call(token)
    JWT.decode(token, Rails.application.secrets.secret_key_base)
  rescue
    false
  end
end
