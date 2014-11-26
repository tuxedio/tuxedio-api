describe Api::V1::SessionsController do
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
    it 'responds 200 upon valid authentication with handle and password' do
      post v1_login_path, valid_creds, headers_for(:json)
      expect(response).to have_http_status 200
    end

    it 'responds 401 upon invalid authentication with handle and password' do
      post v1_login_path, invalid_creds, headers_for(:json)
      expect(response).to have_http_status 401
    end

    it 'responds with authentication token for user' do
      post v1_login_path, valid_creds, headers_for(:json)
      expect(response_body[:token]).to_not be_blank
    end
  end

  describe '#logout' do
    it 'responds with 204 status with verified token' do
      allow(AuthToken).to receive(:valid?)
        .and_return(true)

      delete v1_logout_path, {}, headers_for(:json)
      expect(response).to have_http_status 204
    end

    it 'responds with 401 status with invalid credentials' do
      headers = headers_for(:json).merge({:Authorization => '12345'})

      delete v1_logout_path, {}, headers
      expect(response).to have_http_status 401
    end
  end
end
