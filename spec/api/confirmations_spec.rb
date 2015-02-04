describe Api::V1::ConfirmationsController do
  describe '#create' do
    it 'redirects to correct page with valid token' do
      allow(User).to receive(:confirm_by_token)
        .and_return build :user
      get user_confirmation_path

      expect(response).to redirect_to 'http://example.com'
    end

    it 'redirects to correct page with invalid token with errors' do
      allow(User).to receive(:confirm_by_token)
        .and_return OpenStruct.new(errors: %w(many errors indeed))
      get user_confirmation_path

      expect(response).to redirect_to 'http://example.com'
    end
  end
end
