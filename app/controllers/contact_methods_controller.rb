class ContactMethodsController < CrudController
  include PaginatedController

  def index
    @items = ContactMethod.where({ created_by: @current_user.id })
    render 'contact_methods/index'
  end

  # TODO - custom create method to handle PhoneNumber/EmailAddress/Address models
  def create
    create_params = item_params
    create_params[:created_by] = current_user.id.to_s
    create_params[:updated_by] = current_user.id.to_s

    method_type = create_params.delete(:method_type)

    case method_type
    when ContactMethod::EMAIL
      @item = EmailAddress.new(create_params)

    when ContactMethod::PHONE
      @item = PhoneNumber.new(create_params)

    when ContactMethod::ADDRESS
      @item = Address.new(create_params)
    else
      # TODO - throw exception
      binding.pry
    end

    @item.save

    # respond_with(@item)
    render template_prefix + '/show'

  end

  private

    def item_params
      # params.require(...)
      params.permit(:label, :pref, :method_type, :email, :phone, :streetAddress, :locality, :region, :postalCode, :country)
    end

    def model
      ContactMethod
    end

    def template_prefix
      return 'contact_methods'
    end

end
