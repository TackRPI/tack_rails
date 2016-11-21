# ContactMethodsController class definition
# Provides basis CRUD for managing ContactMethod database records
# Overwrites 'create' method from CrudController to create subclassed
# ContactMethod models with more granularity
class ContactMethodsController < CrudController

  def index
    @items = ContactMethod.where({ created_by: @current_user.id })
    render 'contact_methods/index'
  end

  # Creates ContactMethod subclass
  # TODO - this should be abstracted into a separate class definition
  def create
    create_params = item_params
    create_params[:created_by] = current_user.id.to_s

    # Picks ContactMethod subclass

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
    render template_prefix + '/show'

  end

  private

    def item_params
      params.permit(:label, :pref, :email, :phone, :username, :service, :streetAddress, :locality, :region, :postalCode, :country)
    end

    def model
      ContactMethod
    end

    def template_prefix
      return 'contact_methods'
    end

end
