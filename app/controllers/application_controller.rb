require "#{Rails.root}/lib/json_web_token" # TODO - cleaner way to require this?

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  respond_to :json

  # Taken from https://www.sitepoint.com/introduction-to-using-jwt-in-rails/
  attr_reader :current_user

  protected

  def authenticate_request!

    unless user_id_in_token?
      render json: { errors: ['Not Authenticated'] }, status: :unauthorized # TODO - DRY this up.
      return
    end

    @current_user = User.find(auth_token[:user_id])

  rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized # TODO - DRY this up.
  end

  def ensure_admin
    unless @current_user.is_admin?
      render json: { errors: ['Not Authenticated'] }, status: :unauthorized # TODO - DRY this up.
      return
    end
  end

  private

  def http_token
    @http_token ||= if request.headers['Authorization'].present?
      request.headers['Authorization'].split(' ').last
    end
  end

  def auth_token
    @auth_token ||= JsonWebToken.decode(http_token)
  end

  def user_id_in_token?
    http_token && auth_token && auth_token[:user_id].to_i
  end
end
