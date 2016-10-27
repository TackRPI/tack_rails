class ShareProfilesController < CrudController
  include PaginatedController

  def index
    @items = ShareProfile.where({ created_by: @current_user.id })
    render 'share_profiles/index'
  end

  private

    def item_params
      params.require(:share_profile).permit(:label, :contact_method_ids => [])
    end

    def model
      ShareProfile
    end

    def template_prefix
      return 'share_profiles'
    end

end
