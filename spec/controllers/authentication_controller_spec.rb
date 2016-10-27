require 'rails_helper'

RSpec.describe AuthenticationController, type: :controller do

  # Stubbed User Model
  let(:user) { FactoryGirl.build_stubbed(:user) }

  describe 'POST #authenticate_user' do

    # Creates mock expected payload for return
    before do
      @expected = {
        auth_token: JsonWebToken.encode({ user_id: user.id.to_s }),
        user: { id: user.id.to_s, email: user.email }
      }
    end

    # TODO - auth_token and ids are different, resulting from build_stubbed?
    it 'authenticates user' do
      post :authenticate_user, email: user.email, password: user.password
      payload = JSON.parse(response.body).symbolize_keys
      expect(payload[:user]["email"]).to eq(@expected[:user][:email])
    end

  end
end
