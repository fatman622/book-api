require 'rails_helper'

RSpec.describe 'Books API', type: :request do
	let!(:books) { create_list(:book, 10) }
  let(:book_id) { books.first.id }

    # Test suite for GET /books
  describe 'GET /api/v1/books ' do
    # make HTTP get request before each example
    before { get '/api/v1/books' }

    it 'returns books' do
    	json = JSON.parse(response.body)
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

    # Test suite for GET /books/:id
  describe 'GET /books/:id' do
    before { get "/api/v1/books/#{book_id}" }

    context 'when the record exists' do
      it 'returns the book' do
      	json = JSON.parse(response.body)
        expect(json).not_to be_empty
        expect(json['id']).to eq(book_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end


  # Test suite for POST /books
  describe 'POST /books' do
    # valid payload
    let(:valid_attributes) { { text: 'Learn Elm', author: 'Oleg', available: true, pages: '3',  } }

    context 'when the request is valid' do
      before { post '/api/v1/books', params: valid_attributes }

      it 'creates a book' do
      	json = JSON.parse(response.body)
        expect(json['text']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/books', params: { text: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

   # Test suite for DELETE /boks/:id
  describe 'DELETE /books/:id' do
    before { delete "/api/v1/books/#{book_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

end