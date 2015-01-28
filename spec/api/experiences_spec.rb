describe Api::V1::ExperiencesController do
  describe 'GET #index' do
    let!(:experiences) { build_list :experience, 50  }

    before do
      require 'will_paginate/array'

      allow(Experience).to receive(:all).and_return experiences
      get v1_experiences_path, headers_for(:json)
    end

    context 'when user is authenticated' do
      it 'responds with 200 request (authenticated)' do
        authenticate_user

        expect(response).to have_http_status 200
      end
    end

    context 'when user is unauthenticated' do
      it 'responds with 200 request (unauthenticated)' do
        expect(response).to have_http_status 200
      end

      it 'responds with the serialized experiences' do
        expect(response_body[:experiences].length).to be > 0
      end

      it 'paginates the response' do
        expect(response_body[:experiences].length).to eq 30
        expect(response.headers['Link']).to include 'page=2'
      end
    end
  end

  describe 'GET #show' do
    let!(:experience) { build :experience, id: 1 }

    before do
      allow(Experience).to receive(:find).and_return experience
      get v1_experience_path(0), headers_for(:json)
    end

    context 'when user is authenticated' do
      before { authenticate_user }

      it 'responds with 200 request (authenticated)' do
        expect(response).to have_http_status 200
      end
    end

    context 'when user is un authenticated' do
      it 'responds with 200 request' do
        expect(response).to have_http_status 200
      end

      it 'responds with experience object' do
        expect(response_body[:experience]).to_not be_nil
      end

      it 'serializes the attributes of an experience' do
        attrs_for_experience = %w(id location description name)

        attrs_for_experience.each do |attr|
          expect(response_body[:experience][attr]).to eq experience.send attr
        end
      end
    end
  end

  describe 'POST #create' do
    let(:exp) { json :experience }

    before do
      allow_any_instance_of(Experience).to receive(:save).and_return true
    end

    context 'when user is authenticated' do
      before { authenticate_user }

      it 'responds with 201 request (authenticated)' do
        post v1_experiences_path, exp, headers_for(:json)
        expect(response).to have_http_status 201
      end

      it 'creates the experience' do
        expect_any_instance_of(Experience).to receive(:save) { true }
        post v1_experiences_path, exp, headers_for(:json)
      end
    end

    context 'when user is unauthenticated' do
      it 'responds with 401 request (unauthenticated)' do
        post v1_experiences_path, exp
        expect(response).to have_http_status 401
      end

      it 'does not create the experience' do
        expect_any_instance_of(Experience).to_not receive(:save)
        post v1_experiences_path, exp
      end
    end
  end
end
