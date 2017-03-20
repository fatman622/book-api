require 'rails_helper'

RSpec.describe 'Books API', type: :request do
	let!(:books) { create_list(:book, 10) }
  let(:book_id) { books.first.id }

    # Test suite for GET /todos
  describe 'GET /api/v1/books ' do
    # make HTTP get request before each example
    before { get '/api/v1/books' }

    it 'returns books' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end