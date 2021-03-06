# UpdateDispatchesController class definition
# Sends a User's UpdateDispatches to the client
class UpdateDispatchesController < ApplicationController
  respond_to :json
  before_filter :authenticate_request!

  def index
    @items = UpdateDispatch.where({ user_id: @current_user.id })
    render 'update_dispatches/index'
  end

  def destroy
    @item = UpdateDispatch.find(params[:id])
    render json: { destroyed: @item.destroy }
  end

end
