# ShareProfilesController class definition
# Provides basis CRUD for managing ShareProfile database records
class ShareProfilesController < CrudController

  def index
    @items = ShareProfile.where({ created_by: @current_user.id })
    render 'share_profiles/index'
  end

  # POST /share_profiles/:id/share
  # Adds a user the the ShareProfile's 'shared_with' attribute
  # Used in the 'AddByTackUsername' scenario
  def share

    # Queries User by Tack Username
    item = ShareProfile.find(params[:share_profile_id])
    user = User.where({ username: params[:username] }).first

    # If user exists
    if item && user && user.id

      # Adds user to linked users
      item.linked_users << user

      # Updates ShareProfile
      if item.save()
        render json: {success: true}
      else
        render json: {errors: item.errors.messages }
      end

    # Throws error if Username or ShareProfile don't exist
    else
      render json: {errors: ['Invalid Tack Username']}, status: :unauthorized
    end

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
