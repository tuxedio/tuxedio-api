describe SessionsController do
  before(:all) do
    @user = create :user,
      email: 't@t.com',
      password: 'foobar123',
      authentication_token: '12345'
  end

  after(:all) { delete_db }

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
    it 'responds with 401 status with invalid credentials' do
      delete logout_path, user_email: 't@t.com', user_token: '54321',
        format: :json
      expect(response.status).to eq 401
    end

    it 'responds with 200 status with valid credentials' do
      delete logout_path, user_email: 't@t.com', user_token: '12345',
        format: :json
      expect(response.status).to eq 200
    end

    it 'removes the authentication token upon logout' do
      user = create :user, email: 'b@b.com', authentication_token: '12345'
      delete logout_path, user_email: 'b@b.com', user_token: '12345',
        format: :json

      delete logout_path, user_email: 'b@b.com', user_token: '12345',
        format: :json

      expect(response.status).to eq 401
    end
  end
end
