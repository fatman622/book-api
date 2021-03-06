require 'rails_helper'

RSpec.describe 'BookContent API', type: :request do
	let!(:books_contents) { create_list(:book_content, 10) }
  let(:book_content_id) { books_contents.first.id }
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
    # Test suite for GET /books_content
  describe 'GET /api/v1/books_contents' do

    before {
      post '/api/v1/auth', params: valid_attributes_registry
      get '/api/v1/books_contents', headers: auth_headers
    }

    it 'returns books_contents' do
    	json = JSON.parse(response.body)
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code OK' do
      expect(response).to have_http_status(:ok)
    end
  end

    # Test suite for GET /books_contents/:id
  describe 'GET /books_contents/:id' do
    before {
      post '/api/v1/auth', params: valid_attributes_registry
      get "/api/v1/books_contents/#{book_content_id}", headers: auth_headers 
    }

    context 'when the record exists' do
      it 'returns the readme' do
      	json = JSON.parse(response.body)
        expect(json).not_to be_empty
        expect(json['id']).to eq(book_content_id)
      end

      it 'returns status code OK' do
        expect(response).to have_http_status(:ok)
      end
    end
  end


  # Test suite for POST /books_contents
  describe 'POST /books_contents' do
    # valid payload
    let(:valid_attributes) { { text: "Learn" } }

    context 'when the request is valid' do
      before {
        post '/api/v1/auth', params: valid_attributes_registry
        post '/api/v1/books_contents', params: valid_attributes, headers: auth_headers 
      }

      it 'creates a book_content' do
      	json = JSON.parse(response.body)
        expect(json['text']).to eq('Learn')
      end

      it 'returns status code CREATED' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'when the request is invalid' do
      before {
        post '/api/v1/auth', params: valid_attributes_registry
        post '/api/v1/books_contents', params: { }, headers: auth_headers 
      }

      it 'returns status code Unprocessable_entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

   # Test suite for PUT /books_contents
  describe 'PUT /books_contents/:id' do
    # valid payload
    let(:valid_attributes) { { text: 'Learn Elm' } }

    context 'when the request is valid' do
      before {
        post '/api/v1/auth', params: valid_attributes_registry
        put '/api/v1/books_contents/1', params: valid_attributes, headers: auth_headers 
      }

      it 'returns status code CREATED' do
        expect(response).to have_http_status(:created)
      end
    end
  end

    # Test suite for Show /books_contents/:id
  describe 'GET /books_contents/:id' do
    before {
      post '/api/v1/auth', params: valid_attributes_registry
      get "/api/v1/books_contents/#{book_content_id}", headers: auth_headers 
    }

    it 'returns status code ok' do
      expect(response).to have_http_status(:ok)
    end
  end

   # Test suite for DELETE /books_contents/:id
  describe 'DELETE /books_contents/:id' do
    before {
      post '/api/v1/auth', params: valid_attributes_registry
      delete "/api/v1/books_contents/#{book_content_id}", headers: auth_headers 
    }

    it 'returns status code NO_CONTENT' do
      expect(response).to have_http_status(:no_content)
    end
  end
end