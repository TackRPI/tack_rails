class UpdateDispatchesController < ApplicationController

  before_filter :authenticate_request! # TODO - application controller?

  def index
    # @items = UpdateDispatch.where({ created_by: @current_user.id })
    @items = UpdateDispatch.all()
    render 'update_dispatches/index'
  end

end
