require 'jwt'

class AuthToken
  attr_reader :token, :payload, :expiry

  def initialize(payload)
    @payload = payload
    @token = tokenize_payload
  end

  def tokenize_payload
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  def self.valid?(token)
    JWT.decode(token, Rails.application.secrets.secret_key_base)
  rescue
    false
  end

  def self.user_from_token(token)
    decoded = JWT.decode(token, Rails.application.secrets.secret_key_base)
    data = decoded.first { |n| n['user'] }
    email = data['user']['email']
    User.find_by email: email
  end
end
