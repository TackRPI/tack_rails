class ContactsController < ApplicationController

  before_filter :authenticate_request! # TODO - application controller?

  def index
    @items = Contact.where({ created_by: @current_user.id })
    render 'contacts/index'
  end

end
