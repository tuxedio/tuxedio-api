class RequestAuthenticator
  class << self
    def call(request)
      token = extract_token_from_request request
      token_valid? token
    end

    private

    def token_valid?(token)
      JWT.decode token, Rails.application.secrets.secret_key_base
    rescue
      false
    end

    def extract_token_from_request(request)
      auth_headers = request.headers['Authentication'] || ''
      auth_headers.split(' ').last
    end
  end
end
