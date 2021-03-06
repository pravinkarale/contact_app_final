require 'rails_helper'

RSpec.describe Api::UsersController, type: 'request' do
	describe 'POST /api/users' do
		let(:valid_params) do
      {
        user: {
          first_name: "maria",
          last_name: "Dsouza",
          email: "mariad@gmail.com",
          message: "Hello there, how are you?",
          locale: 'en'
        }
      }
    end

    let(:invalid_params) do
      {
        user: {
          first_name: "maria",
          last_name: "Dsouza",
          email: "mariad@gmail.com",
          locale: 'en'
        }
      }
    end

		it 'send message with valid data' do
			expect { post "/api/users", params: valid_params }.to change(User, :count).by(+1)
			resp = JSON.parse(response.body)
			expect(resp['result']).to eq 'success'
		end

		it 'send message with invalid data' do
			post "/api/users", params: invalid_params
			resp = JSON.parse(response.body)
			expect(resp['result']).to eq 'failure'
		end
	end

end
