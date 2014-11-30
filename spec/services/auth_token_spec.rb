describe AuthToken do
  let(:payload) { { test: true, data: 'test'} }
  subject { AuthToken.new payload }

  describe '#tokenize_payload' do
    it 'encodes the payload' do
      expect(subject.tokenize_payload).to match /[a-zA-z0-9.]+/
    end
  end

  describe '#valid' do
    it 'becomes invalid after expiry' do
      token = AuthToken.new(payload, expiry: 48.hours.ago)
      expect(AuthToken.valid?(token)).to eq false
    end
  end
end
