require 'rails_helper'
RSpec.describe 'User API', type: :request do
	let!(:user) { create_list(:user, 10) }
  let(:user_id) { users.first.id }
  let(:profile_id) { user.first.profile.id }
   # valid payload
    let(:valid_attributes) { {"email": "olegbabyd@gmail.com", "password": "123456789", "password_confirmation": "123456789"} }
    let(:invalid_attributes) { {"email": "olegbabyd@gmail.com", "password": "123456789", "password_confirmation": "1234569"} }
    let(:valid_attributes_sign_in) { {"email": "olegbabyd@gmail.com", "password": "123456789", "password_confirmation": "123456789"} }
    let(:auth_headers) {
      { 
        "access-token": response.headers['access-token'],
        "token-type":   response.headers['token-type'],
        "client":       response.headers['client'],
        "expiry":       response.headers['expiry'],
        "uid":          response.headers['uid'] 
      }
    }

  describe 'POST /auth' do
    context 'when the request is valid' do
      before { post '/api/v1/auth', params: valid_attributes }
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end   
    end

    context 'when the request is invalid' do
      before { post '/api/v1/auth', params: invalid_attributes }
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end   
    end

    context 'when the profile exists' do
      before { 
        post '/api/v1/auth', params: valid_attributes
        get "/api/v1/profiles/#{profile_id}", headers: auth_headers 
      }
      it 'returns the profile' do
        json = JSON.parse(response.body)
        expect(json).not_to be_empty
        expect(json['id']).to eq(1)
      end

      it 'returns status code OK' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  # Test suite for GET /profiles
  describe 'GET /api/v1/profiles' do
    before {
      post '/api/v1/auth', params: valid_attributes
      get '/api/v1/profiles', headers: auth_headers
    }

    it 'returns profiles' do
      json = JSON.parse(response.body)
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code OK' do
      expect(response).to have_http_status(:ok)
    end
  end


  describe 'POST /auth/sign_in' do
    context 'when the user is' do
      before {
        post '/api/v1/auth', params: valid_attributes
        post '/api/v1/auth/sign_in', params: valid_attributes_sign_in, headers: auth_headers 
      }
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

     # Test suite for PUT /profiles
    describe 'PUT /profiles/:id' do
      let(:valid_attributes_profile) { { first_name: 'Oleg', last_name: 'Babiy'} }
      
      context 'when the request is valid' do
        before {
          post '/api/v1/auth', params: valid_attributes
          put "/api/v1/profiles/#{profile_id}", params: valid_attributes_profile, headers: auth_headers 
        }

        it 'returns status code NO_CONTENT' do
          expect(response).to have_http_status(:created)
        end
      end
    end

    # Test suite for Show /profiles/:id
    describe 'GET /profiles/:id' do
      before {
        post '/api/v1/auth', params: valid_attributes
        get "/api/v1/profiles/#{profile_id}", headers: auth_headers 
      }

      it 'returns status code OK' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  # Test suite for SignOut /auth/sign_out
  describe 'POST /auth/sign_out' do
    context 'when the user signout' do
      before {
        post '/api/v1/auth', params: valid_attributes
        delete '/api/v1/auth/sign_out', headers: auth_headers 
      }

      it 'returns status code OK' do
        expect(response).to have_http_status(200)
      end
    end
  end
end