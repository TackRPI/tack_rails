require 'rails_helper'


# AuthenticationController tests
RSpec.describe AuthenticationController, type: :controller do

  # POST /auth_user
  describe 'POST #authenticate_user' do

    # Creates mock expected payload for return
    before do

      # User Model Mock
      @user = FactoryGirl.create(:user)

      # Expected response
      @expected = {
        auth_token: JsonWebToken.encode({ user_id: @user.id.to_s }),
        user: { id: @user.id.to_s, email: @user.email }
      }

    end

    # Authenticates user and compares payload to parameters
    # Ensures equality of email and auth_token
    it 'authenticates user' do

      # Gets payload
      post :authenticate_user, email: @user.email, password: @user.password
      payload = JSON.parse(response.body).symbolize_keys

      # Ensures equality
      expect(payload[:user]["email"]).to eq(@expected[:user][:email])
      expect(payload[:auth_token]).to eq(@expected[:auth_token])

    end

    # Authentication fails when
    # incorrect email is sent in
    it 'fails to authenticate user with invalid email' do

      # Gets payload
      post :authenticate_user, email: 'wrong@email.com', password: @user.password
      payload = JSON.parse(response.body).symbolize_keys

      # Ensures errors hash is sent down
      expect(payload[:errors]).to be_truthy

    end

    # Authentication fails when
    # incorrect password is sent in
    it 'fails to authenticate user with invalid email' do

      # Gets payload
      post :authenticate_user, email: @user.email, password: 'wrong-password'
      payload = JSON.parse(response.body).symbolize_keys

      # Ensures errors hash is sent down
      expect(payload[:errors]).to be_truthy

    end

    # Test cleanup
    # destroys @user instance
    after do
      @user.destroy()
    end

  end

  # POST /auth/register
  # TODO
  describe 'POST #register'
    it 'test loads' do
      expect(true).to eq(true)
    end
  end


