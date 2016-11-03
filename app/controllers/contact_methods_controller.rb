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

    # Picks ContactMethod subclass
    # TODO - should this be broken out into a separate class?
    # At the very least a separate method

    # Email
    if create_params[:email]
      @item = EmailAddress.new(create_params)

    # Phone
    elsif create_params[:phone]
      @item = PhoneNumber.new(create_params)

    # Address
    elsif create_params[:country]
      @item = Address.new(create_params)

    # Social
    elsif create_params[:username]
      @item = SocialAccount.new(create_params)

    # ELSE
    else
      # TODO - throw exception
    end

    @item.save
    # respond_with(@item) # TODO - why isn't this working??
    render template_prefix + '/show'

  end

  private

    def item_params
      # params.require(...)
      params.permit(:label, :pref, :email, :phone, :username, :service, :streetAddress, :locality, :region, :postalCode, :country)
    end

    def model
      ContactMethod
    end

    def template_prefix
      return 'contact_methods'
    end

end
