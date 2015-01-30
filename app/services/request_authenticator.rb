class RequestAuthenticator
  class << self
    def call(headers)
      token = extract_token_from_headers(headers)
      JWT.decode(token, Rails.application.secrets.secret_key_base)
    rescue
      false
    end

    private

    def extract_token_from_headers(headers)
      auth_headers = headers['Authentication'] || ''
      auth_headers.split(' ').last
    end
  end
end
