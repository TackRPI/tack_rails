require "#{Rails.root}/lib/json_web_token" # TODO - cleaner way to require this?

class AuthenticationController < ApplicationController

  # POST /auth_user
  def authenticate_user
    user = User.find_for_database_authentication(email: params[:email])
    if user.valid_password?(params[:password])
      render json: payload(user)
    else
      render json: {errors: ['Invalid Username/Password']}, status: :unauthorized
    end
  end

  # POST /auth/register
  # TODO - this doesn't fail when parameters are invalid
  def register

    # Return error if params aren't defined
    if !params[:email] || !params[:password] || !params[:password_confirmation]
      render json: { errors: true }, status: :bad_request
    end

    # New User
    user = User.new({ email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation] })
    user.save()

    # If no errors...
    if user.errors.messages.empty?
      render json: payload(user)
    else
      render json: { errors: user.errors.messages }, status: :bad_request
    end

  end

  private

  def payload(user)
    return nil unless user and user.id
    {
      auth_token: JsonWebToken.encode({ user_id: user.id.to_s }),
      user: { id: user.id.to_s, email: user.email }
    }
  end

end
