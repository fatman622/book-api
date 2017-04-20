# require 'rails_helper'

# RSpec.describe 'Profiles API', type: :request do
#   let(:valid_attributes_registry) { {"email": "olegbabyd@gmail.com", "password": "123456789", "password_confirmation": "123456789"} }
# 	before { post '/api/v1/auth', params: valid_attributes_registry }
#   let!(:profiles) { create_list(:profile, 1) }
#   let(:profile_id) { profiles.first.id }
#   let(:user_id) { profiles.first.user_id }
 
#   let(:auth_headers) {
#     { 
#       "access-token": response.headers['access-token'],
#       "token-type":   response.headers['token-type'],
#       "client":       response.headers['client'],
#       "expiry":       response.headers['expiry'],
#       "uid":          response.headers['uid'] 
#     }
#   }
#     # Test suite for GET /profiles
#   describe 'GET /api/v1/profiles' do

#     before {
#       post '/api/v1/auth', params: valid_attributes_registry
#       get '/api/v1/profiles', headers: auth_headers
#     }

#     it 'returns profiles' do
#     	json = JSON.parse(response.body)
#       # Note `json` is a custom helper to parse JSON responses
#       expect(json).not_to be_empty
#       expect(json.size).to eq(2)
#     end

#     it 'returns status code 200' do
#       expect(response).to have_http_status(200)
#     end
#   end

#     # Test suite for GET /profiles/:id
#   describe 'GET /profiles/:id' do
#     before {
#       post '/api/v1/auth', params: valid_attributes_registry
#       get "/api/v1/profiles/#{profile_id}", headers: auth_headers 
#     }

#     context 'when the profile exists' do
#       it 'returns the profile' do
#       	json = JSON.parse(response.body)
#         expect(json).not_to be_empty
#         expect(json['id']).to eq(2)
#       end

#       it 'returns status code 200' do
#         expect(response).to have_http_status(200)
#       end
#     end
#   end


#    # Test suite for PUT /profiles
#   describe 'PUT /profiles/:id' do
#     # valid payload
#     let(:valid_attributes) { { first_name: 'Oleg', last_name: 'Babiy', user_id: '1'} }

#     context 'when the request is valid' do
#       before {
#         post '/api/v1/auth', params: valid_attributes_registry
#         put '/api/v1/profiles/1', params: valid_attributes, headers: auth_headers 
#       }

#       it 'returns status code 201' do
#         expect(response).to have_http_status(201)
#       end
#     end
#   end

#     # Test suite for Show /profiles/:id
#   describe 'GET /profiles/:id' do
#     before {
#       post '/api/v1/auth', params: valid_attributes_registry
#       get "/api/v1/profiles/#{profile_id}", headers: auth_headers 
#     }

#     it 'returns status code 200' do
#       expect(response).to have_http_status(200)
#     end
#   end

# end