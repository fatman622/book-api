require 'rails_helper'

RSpec.describe 'Books API', type: :request do
	let!(:books) { create_list(:book, 10) }
  let(:book_id) { books.first.id }
  let(:valid_attributes_registry) { {"email": "olegbabyd@gmail.com", "password": "123456789", "password_confirmation": "123456789"} }
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
  describe 'GET /api/v1/books' do

    before {
      post '/api/v1/auth', params: valid_attributes_registry
      get '/api/v1/books', headers: auth_headers
    }

    it 'returns books' do
    	json = JSON.parse(response.body)
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:ok)
    end
  end

    # Test suite for GET /books/:id
  describe 'GET /books/:id' do
    before {
      post '/api/v1/auth', params: valid_attributes_registry
      get "/api/v1/books/#{book_id}", headers: auth_headers 
    }

    context 'when the record exists' do
      it 'returns the book' do
      	json = JSON.parse(response.body)
        expect(json).not_to be_empty
        expect(json['id']).to eq(book_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end
    end
  end


  # Test suite for POST /books
  describe 'POST /books' do
    # valid payload
    let(:valid_attributes) { { text: 'Learn Elm', author: 'Oleg', available: true, pages: '3',  } }

    context 'when the request is valid' do
      before {
        post '/api/v1/auth', params: valid_attributes_registry
        post '/api/v1/books', params: valid_attributes, headers: auth_headers 
      }

      it 'creates a book' do
      	json = JSON.parse(response.body)
        expect(json['text']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'when the request is invalid' do
      before {
        post '/api/v1/auth', params: valid_attributes_registry
        post '/api/v1/books', params: { text: 'Foobar' }, headers: auth_headers 
      }

      it 'returns status code 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

   # Test suite for PUT /books
  describe 'PUT /books/:id' do
    # valid payload
    let(:valid_attributes) { { author: 'Oleg', text: 'Learn Elm', available: true, pages: '3' } }

    context 'when the request is valid' do
      before {
        post '/api/v1/auth', params: valid_attributes_registry
        put "/api/v1/books/#{book_id}", params: valid_attributes, headers: auth_headers 
      }

      it 'returns status code 201' do
        expect(response).to have_http_status(:created)
      end
    end
  end

    # Test suite for Show /boks/:id
  describe 'GET /books/:id' do
    before {
      post '/api/v1/auth', params: valid_attributes_registry
      get "/api/v1/books/#{book_id}", headers: auth_headers 
    }

    it 'returns status code 200' do
      expect(response).to have_http_status(:ok)
    end
  end

   # Test suite for DELETE /boks/:id
  describe 'DELETE /books/:id' do
    before {
      post '/api/v1/auth', params: valid_attributes_registry
      delete "/api/v1/books/#{book_id}", headers: auth_headers 
    }

    it 'returns status code 204' do
      expect(response).to have_http_status(:no_content)
    end
  end

  # Test suite for SEARCH for GET /books/search
  describe 'GET /books/search' do
    before {
      post '/api/v1/auth', params: valid_attributes_registry
      get '/api/v1/books/search', headers: auth_headers 
    }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end


end