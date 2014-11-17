describe SessionsController do
  before do
    @user = create :user,
      email: 't@t.com',
      password: 'foobar123',
      authentication_token: '12345'
  end

  after { delete_db }

  let(:valid_creds) do
    json :login_creds, user: { email: 't@t.com', password: 'foobar123' }
  end
  let(:invalid_creds) do
    json :login_creds, user: { email: 'invalid@t.com', password: 'foobar123' }
  end

  describe '#login' do
    it 'responds 200 upon valid authentication with username and password' do
      post login_path, valid_creds, headers_for(:json)
      expect(response.status).to eq 200
    end

    it 'responds 401 upon invalid authentication with username and password' do
      post login_path, invalid_creds, headers_for(:json)
      expect(response.status).to eq 401
    end

    it 'responds with authentication token for user' do
      post login_path, valid_creds, headers_for(:json)
      expect(response_body[:authentication_token]).to_not be_blank
    end
  end

  describe '#logout' do
    it 'destroys the authentication token upon logout' do
      delete logout_path, { authentication_token: '12345' }.to_json,
        headers_for(:json)
      expect(response.status).to eq 200
    end
  end
end
