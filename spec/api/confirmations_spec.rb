describe Api::V1::ConfirmationsController do
  describe 'GET #show' do
    before do
      allow_any_instance_of(Api::V1::ConfirmationsController)
        .to receive(:confirmations_params)
        .and_return callback: 'http://test.com'
    end

    it 'redirects to callback URL' do
      get user_confirmation_path

      expect(response).to redirect_to 'http://test.com'
    end
  end
end
