class TokenExtractor
  def self.call(token)
    decoded = JWT.decode(token, Rails.application.secrets.secret_key_base)
    data = decoded.first { |n| n['user'] }
    email = data['user']['email']
    User.find_by email: email
  end
end
