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
  def register

    # New User
    user = User.new({ email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation] })
    user.save()

    # If errors...
    if !!user.errors.messages
      render json: payload(user)
    else
      render json: { errors: user.errors.messages }
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
