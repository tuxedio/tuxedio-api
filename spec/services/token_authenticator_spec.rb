describe TokenAuthenticator do
  after { delete_db }

  let(:payload) { login_hash :user }
  let(:token) { TokenCreator.call payload }

  subject { TokenAuthenticator.call token }

  describe '.call' do
    it 'decodes the payload' do
      is_expected.to include payload
    end
  end
end
