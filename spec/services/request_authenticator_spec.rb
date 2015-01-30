describe RequestAuthenticator do
  after { delete_db }

  let(:payload) { login_hash :user }
  let(:token) { TokenCreator.call payload }
  let(:headers) { { 'Authentication' => "Bearer #{token}" } }

  subject { RequestAuthenticator.call headers }

  describe '.call' do
    it 'decodes the payload' do
      is_expected.to include payload
    end
  end
end
