describe AuthToken do
  after { delete_db }

  let(:user) { create :user }
  let(:payload) do
    {
      'user' => {
        'email' => user.email,
        'password' => user.password
      }
    }
  end

  subject { AuthToken.new payload }

  describe '#tokenize_payload' do
    it 'encodes the payload' do
      expect(subject.tokenize_payload).to match(/[a-zA-Z0-9.]+/)
    end
  end

  describe '.valid' do
    it 'decodes the payload' do
      expect(AuthToken.valid?(subject.token)).to include payload
    end
  end

  describe '.user_from_token' do
    it 'extracts the user' do
      found_user = AuthToken.user_from_token(subject.token)

      expect(found_user).to be_a User
      expect(found_user.email).to eq user.email
    end
  end
end
