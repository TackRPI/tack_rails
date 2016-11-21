
# Requires JSONWebToken middleware
require "#{Rails.root}/lib/json_web_token"

# AuthenticationController
# Manages user authentication and registration
class AuthenticationController < ApplicationController

  # POST /auth_user
  # Returns authentication payload for user/password combination
  # Returns error if user not defined, or if password invalid
  def authenticate_user
    user = User.find_for_database_authentication(email: params[:email])
    if user && user.valid_password?(params[:password])
      render json: payload(user)
    else
      render json: {errors: ['Invalid Username/Password']}, status: :unauthorized
    end
  end

  # POST /auth/register
  # Returns authentication payload for new users who sucessfully register
  # Returns error if registration parameters are missing or invalid
  def register

    # New User
    user = User.new(register_params)
    user.save()

    # If no errors...
    if user.errors.messages.empty?
      # Returns user authentication payload
      render json: payload(user)
    else
      # Returns error messages
      render json: { errors: user.errors.messages }, status: :bad_request
    end

  end

  # Private method responsible for building User payload
  # Payload contains authentication token used
  # by the client for all requests
  private
  def payload(user)
    return nil unless user and user.id
    {
      auth_token: JsonWebToken.encode({ user_id: user.id.to_s }),
      user: { id: user.id.to_s, email: user.email }
    }
  end

  # Registration parameters helpfer function
  # plucks only desired attributes
  def register_params
    params.permit(:email, :password, :password_confirmation, :username, :display_name)
  end

end
