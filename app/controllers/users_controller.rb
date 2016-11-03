class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  before_filter :authenticate_request!

  def show
    render 'users/show'
  end

  private

    def item_params
      # params.require(...)
      params.permit(:email, :password, :password_confirmation)
    end

    def set_user
      # .find_by({ username: params[:id] })
      @user = User.find(params[:id])
    end

end
