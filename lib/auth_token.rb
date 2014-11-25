require 'jwt'

class AuthToken
  attr_reader :token, :payload

  def initialize(payload)
    @payload = payload
    @token = tokenize_payload
  end

  def tokenize_payload
    payload['exp'] = 24.hours.from_now.to_i
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
