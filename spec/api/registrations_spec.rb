describe Devise::RegistrationsController do
  after(:all) { delete_db }
  let(:user) { build :user_registration }

  describe '#create' do
    before { post user_registration_path, user.to_json, headers_for(:json) }

    it 'responds with 201 HTTP status upon proper request' do
      expect(response).to have_http_status 201
    end

    it 'creates the record with correct attributes' do
      attrs = user[:user].stringify_keys
      record = User.first

      attrs.each do |key, val|
        expect(record.send(key)).to eq val unless key.include? 'password'
      end
    end
  end
end
