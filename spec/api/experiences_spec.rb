describe Api::V1::ExperiencesController do
  describe '#index' do
    before(:all) { create_list :experience, 30 }
    before(:all) { get v1_experiences_path, headers_for(:json) }
    after { delete_db }

    it 'responds with 200 request (authenticated)' do
      allow(AuthToken).to receive(:valid?).and_return true

      expect(response).to have_http_status 200
    end

    it 'responds with 200 request (unauthenticated)' do
      expect(response).to have_http_status 200
    end

    it 'responds with the serialized experiences' do
      expect(response_body[:experiences].length).to be > 0
    end

    it 'paginates the response' do
      expect(response_body[:experiences].length).to eq 25
      expect(response.headers['Link']).to_not be_blank
      expect(response.headers['Link']).to include 'page=2'
    end
  end

  describe '#get' do
    before(:all) { @exp = create :experience }
    before(:all) { get v1_experience_path(@exp), headers_for(:json) }

    it 'responds with 200 request (authenticated)' do
      allow(AuthToken).to receive(:valid?).and_return true

      expect(response).to have_http_status 200
    end

    it 'responds with 200 request (unauthenticated)' do
      expect(response).to have_http_status 200
    end

    it 'responds with experience object' do
      expect(response_body[:experience]).to_not be_nil
    end

    it 'serializes the attributes of an experience' do
      attrs_for_experience = %w(id location description name)

      attrs_for_experience.each do |attr|
        expect(response_body[:experience][attr]).to eq @exp.send attr
      end
    end
  end
end
