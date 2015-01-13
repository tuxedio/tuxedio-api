describe TokenExtractor do
  after { delete_db }

  let(:payload) { login_hash :user }
  let(:token) { TokenCreator.call payload }

  subject { TokenExtractor.call token }

  describe '.call' do
    it 'extracts the user' do
      is_expected.to be_a User
      expect(subject.email).to eq payload['user']['email']
    end
  end
end
