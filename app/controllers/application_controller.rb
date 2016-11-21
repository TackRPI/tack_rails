# Imports the json_web_token helper class defined in /lib/
require "#{Rails.root}/lib/json_web_token"


# ApplicationController class definition
# defines authenticate_request! and helper methods
# used in all controllers to manage authenitcated users
class ApplicationController < ActionController::Base

  # Application-wide JSON-only responses
  respond_to :json

  # Referenced: https://www.sitepoint.com/introduction-to-using-jwt-in-rails/
  attr_reader :current_user

  protected

  def authenticate_request!

    unless user_id_in_token?
      return unauthorized_error()
    end

    @current_user = User.find(auth_token[:user_id])

  rescue JWT::VerificationError, JWT::DecodeError
    return unauthorized_error()
  end

  private

  def unauthorized_error
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end

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
