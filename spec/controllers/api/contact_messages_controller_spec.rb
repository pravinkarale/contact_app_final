require 'rails_helper'

RSpec.describe Api::ContactMessagesController, type: 'request' do
	describe 'POST /api/contact_messages' do
		let(:valid_params) do
      {
         contact_message: {
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
         contact_message: {
          first_name: "maria",
          last_name: "Dsouza",
          email: "mariad@gmail.com",
          locale: 'en'
        }
      }
    end

		it 'send message with all required parameters' do
			expect { post "/api/contact_messages", params: valid_params }.to change(ContactMessage, :count).by(+1)
			resp = JSON.parse(response.body)
			expect(resp['result']).to eq 'success'
		end

		it 'send message with insufficient parameters' do
			post "/api/contact_messages", params: invalid_params
			resp = JSON.parse(response.body)
			expect(resp['result']).to eq 'failure'
		end
		
	end

end
