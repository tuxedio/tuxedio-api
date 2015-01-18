describe TokenCreator do
  let(:payload) { login_hash :user }

  subject { TokenCreator.call payload }

  describe '#call' do
    it 'encodes the payload' do
      is_expected.to match(/[a-zA-Z0-9.]+/)
    end
  end
end
