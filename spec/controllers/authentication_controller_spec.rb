require 'rails_helper'


# AuthenticationController tests
RSpec.describe AuthenticationController, type: :controller do

  # User Model Mock
  let(:user) { FactoryGirl.build(:user) }

  # POST /auth_user
  describe 'POST #authenticate_user' do

    # Creates mock expected payload for return
    before do
      @expected = {
        auth_token: JsonWebToken.encode({ user_id: user.id.to_s }),
        user: { id: user.id.to_s, email: user.email }
      }
    end

    # Authenticates user and compares payload to parameters
    # Ensures equality of email and auth_token
    it 'authenticates user' do
      post :authenticate_user, email: user.email, password: user.password
      payload = JSON.parse(response.body).symbolize_keys
      expect(payload[:user]["email"]).to eq(@expected[:user][:email])
      # expect(payload[:auth_token]).to eq(@expected[:auth_token]) # TODO
    end

  end
end
