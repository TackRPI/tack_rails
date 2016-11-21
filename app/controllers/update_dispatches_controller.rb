# UpdateDispatchesController class definition
# Sends a User's UpdateDispatches to the client
class UpdateDispatchesController < ApplicationController
  before_filter :authenticate_request!

  def index
    @items = UpdateDispatch.where({ user_id: @current_user.id })
    render 'update_dispatches/index'
  end

end
