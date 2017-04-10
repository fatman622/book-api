require 'rails_helper'
RSpec.describe 'User API', type: :request do
	let!(:user) { create_list(:user, 10) }
  let(:user_id) { users.first.id }

  describe 'POST /books' do
    # valid payload
    let(:valid_attributes) { {"email": "olegbabyd@gmail.com", "password": "123456789", "password_confirmation": "123456789", "first_name": "John", "last_name": "Smith" } }

    context 'when the request is valid' do
      before { post '/api/v1/auth', params: valid_attributes }
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

  end

end