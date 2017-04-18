require 'rails_helper'
RSpec.describe 'User API', type: :request do
	let!(:user) { create_list(:user, 10) }
  let(:user_id) { users.first.id }
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
  end

  describe 'POST /auth/sign_out' do
    context 'when the user signout' do
      before {
        post '/api/v1/auth', params: valid_attributes
        delete '/api/v1/auth/sign_out', headers: auth_headers 
      }
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end