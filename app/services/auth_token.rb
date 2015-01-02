require 'jwt'

class AuthToken
  attr_reader :token, :payload, :expiry

  def initialize(payload, expiry: 168.hours.from_now)
    @payload = payload
    @token = tokenize_payload
    @expiry = expiry.to_i
  end

  def tokenize_payload
    payload['exp'] = expiry
    JWT.encode payload, Rails.application.secrets.secret_key_base
  end

  def self.valid?(token)
    begin
      JWT.decode token, Rails.application.secrets.secret_key_base
    rescue
      false
    end
  end
end
