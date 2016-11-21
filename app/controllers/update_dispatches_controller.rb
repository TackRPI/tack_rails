class UpdateDispatchesController < ApplicationController

  before_filter :authenticate_request! # TODO - application controller?

  def index
    @items = UpdateDispatch.where({ user_id: @current_user.id })
    render 'update_dispatches/index'
  end

end
