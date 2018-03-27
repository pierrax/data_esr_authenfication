require 'rails_helper'

RSpec.describe Api::UsersController, :type => :request do
  include Rack::Test::Methods

  describe '#check_token' do
    context 'when token is valid' do
      it 'returns 200 code' do
        api_logged_in_as_user
        post 'api/check_token', format: :json
        expect(last_response.status).to eq(200)
      end
    end

    context 'when token is invalid' do
      it 'returns 401 code' do
        create(:user)
        header('Authorization', 'Bearer 1234567890')
        post 'api/check_token', format: :json
        expect(last_response.status).to eq(401)
      end
    end
  end
end
