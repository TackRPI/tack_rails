require 'rails_helper'

RSpec.describe ShareProfilesController, type: :controller do

  describe 'GET #show' do

    before(:each) do
      @item = create(:share_profile)
    end

    it 'responds successfully with an HTTP 200 status code' do
      get :show, id: @item.id.to_s
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

end
