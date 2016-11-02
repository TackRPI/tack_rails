class CrudController < ApplicationController

  # before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_item, only: [:show, :update, :destroy]

  respond_to :json # TODO - application controller
  skip_before_filter :verify_authenticity_token, only: [:create, :update] # TODO - wat?
  before_filter :authenticate_request! # TODO - application controller?

  def show
    @item.decorate() if @item.respond_to? :decorate
    render template_prefix + '/show'
  end

  def new
    render template_prefix + '/new'
  end

  def create

    # TODO - this should be revisited
    create_params = item_params
    create_params[:created_by] = current_user.id.to_s
    create_params[:updated_by] = current_user.id.to_s

    @item = model.new(create_params)
    @item.save

    respond_with(@item)
  end

  def update
    # @item.updated_by = current_user.email
    @item.update(item_params)
    render template_prefix + '/update'
  end

  def destroy
    @item.destroy
    respond_with(@item)
  end

  private

    def set_item
      @item = if params[:id] then model.find(params[:id]) else model.new() end
    end

end
