describe Api::V1::ExperiencesController do
  before { create_list :experience, 10 }
  after { delete_db }

  describe '#index' do
    before { get v1_experiences_path, headers_for(:json) }

    it 'responds with 200 request (authenticated)' do
      allow(AuthToken).to receive(:valid?).and_return true

      expect(response).to have_http_status 200
    end

    it 'responds with 200 request (unauthenticated)' do
      expect(response).to have_http_status 200
    end

    it 'responds with the serialized experiences' do
      expect(response_body[:experiences].length).to eq 10
    end
  end
end
