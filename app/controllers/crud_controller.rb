# CrudController class definition
# The CrudController class defines show, create, update, and destroy methods
# used by ContactMethodsController and ShareProfilesController
class CrudController < ApplicationController

  respond_to :json

  before_action :set_item, only: [:show, :update, :destroy]
  before_filter :authenticate_request!
  skip_before_filter :verify_authenticity_token, only: [:create, :update]

  def show
    @item.decorate() if @item.respond_to? :decorate
    render template_prefix + '/show'
  end

  def create
    create_params = item_params
    create_params[:created_by] = current_user.id.to_s
    @item = model.new(create_params)
    @item.save
    render template_prefix + '/show'
  end

  def update
    @item.update(item_params)
    render template_prefix + '/update'
  end

  def destroy
    render json: { destroyed: @item.destroy }
  end

  private

    def set_item
      @item = if params[:id] then model.find(params[:id]) else model.new() end
    end

end
