# TODO - document
class ShareProfilesController < CrudController

  def index
    @items = ShareProfile.where({ created_by: @current_user.id })
    render 'share_profiles/index'
  end

  # POST /share_profiles/:id/share
  # Creates an UpdateDispatch for ShareProfile
  # to the User supplied by the 'username' parameter
  # Simply adds a user the the ShareProfile's 'shared_with' attribute
  # Which can easily be removed later by a standard update - or perhaps un-share?

  # ON THE CLIENT
  # Viewing UpdateDispatches
  # "X shared some info with you!" -> "Share back?"
  def share

    # Queries User by Tack Username
    item = ShareProfile.find(params[:share_profile_id])
    user = User.where({ username: params[:username] }).first # TODO - should use 'find by username' method

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
