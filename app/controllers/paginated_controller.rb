# TODO - this should be a concern rather than a mixin
module PaginatedController

  # Configures controllers in which this module has been included
  def self.included(base)
    base.before_action :set_pagination, only: [:index]
  end

  # Abstract index method for paginating a query
  # Requires pagination_config & model methods

  # TODO - use class variables instead of methods?
  # PaginatedController Configuration
  # @@model         = User
  # @@decorator     = UserDecorator
  # @@item_template = 'users/base'
  def index

    # Pagination Query & Decoration
    # TODO - split this up onto multiple lines, getting a little messy
    items = pagination_config[:decorator].decorate_collection(model.where(params[:query]).order_by(params[:order]).page( @page ).per( @perPage ))

    # Template struct
    @paginated = OpenStruct.new({
      page:           items.current_page,
      per_page:       items.limit_value,
      total_pages:    items.total_pages,
      total_entries:  items.total_count,
      item_template:  pagination_config[:item_template],
      items:          items
    })

    # Renders the template
    render 'base/paginated'
  end

  private

    # Sets page & per_page for pagination
    def set_pagination
      @page     = params[:page] || 1
      @perPage  = params[:per_page] || 25
    end

end
