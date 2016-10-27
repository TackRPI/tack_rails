class UsersController < ApplicationController
  include PaginatedController

  before_action :set_user, only: [:show]

  before_filter :authenticate_request!
  before_filter :ensure_admin, only: [:index]

  def show
    render 'users/show'
  end

  private

    def pagination_config
      return {
        decorator: UserDecorator,
        item_template: 'users/base'
      }
    end


    def model
      User
    end


    def set_user
      # .find_by({ username: params[:id] })
      @user = User.find(params[:id])
    end


    # Sets page & per_page for pagination
    def set_config_pagination
      @page     = params[:page] || 1
      @perPage  = params[:per_page] || 25
    end

end
