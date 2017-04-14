require 'rails_helper'

RSpec.describe 'Readnme API', type: :request do
	let!(:readmes) { create_list(:readme, 10) }
  let(:readme_id) { readmes.first.id }
  let(:valid_attributes_registry) { {"email": "olegbabyd@gmail.com", "password": "123456789", "password_confirmation": "123456789", "first_name": "John", "last_name": "Smith" } }
  let(:auth_headers) {
    { 
      "access-token": response.headers['access-token'],
      "token-type":   response.headers['token-type'],
      "client":       response.headers['client'],
      "expiry":       response.headers['expiry'],
      "uid":          response.headers['uid'] 
    }
  }
    # Test suite for GET /books
  describe 'GET /api/v1/readmes' do

    before {
      post '/api/v1/auth', params: valid_attributes_registry
      get '/api/v1/readmes', headers: auth_headers
    }

    it 'returns readmes' do
    	json = JSON.parse(response.body)
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

    # Test suite for GET /readmes/:id
  describe 'GET /readmes/:id' do
    before {
      post '/api/v1/auth', params: valid_attributes_registry
      get "/api/v1/readmes/#{readme_id}", headers: auth_headers 
    }

    context 'when the record exists' do
      it 'returns the readme' do
      	json = JSON.parse(response.body)
        expect(json).not_to be_empty
        expect(json['id']).to eq(readme_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end


  # Test suite for POST /readmes
  describe 'POST /readmes' do
    # valid payload
    let(:valid_attributes) { { text: "Learn" } }

    context 'when the request is valid' do
      before {
        post '/api/v1/auth', params: valid_attributes_registry
        post '/api/v1/readmes', params: valid_attributes, headers: auth_headers 
      }

      it 'creates a readme' do
      	json = JSON.parse(response.body)
        expect(json['text']).to eq('Learn')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before {
        post '/api/v1/auth', params: valid_attributes_registry
        post '/api/v1/readmes', params: { }, headers: auth_headers 
      }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

   # Test suite for PUT /readmes
  describe 'PUT /readmes/:id' do
    # valid payload
    let(:valid_attributes) { { text: 'Learn Elm' } }

    context 'when the request is valid' do
      before {
        post '/api/v1/auth', params: valid_attributes_registry
        put '/api/v1/readmes/1', params: valid_attributes, headers: auth_headers 
      }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end




    # Test suite for Show /readmes/:id
  describe 'GET /readmes/:id' do
    before {
      post '/api/v1/auth', params: valid_attributes_registry
      get "/api/v1/readmes/#{readme_id}", headers: auth_headers 
    }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

   # Test suite for DELETE /readmes/:id
  describe 'DELETE /readmes/:id' do
    before {
      post '/api/v1/auth', params: valid_attributes_registry
      delete "/api/v1/readmes/#{readme_id}", headers: auth_headers 
    }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end