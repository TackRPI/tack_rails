require 'rails_helper'

RSpec.describe SubjectsController, type: :controller do

  describe 'GET #show' do

    before(:each) do
      @subject = create(:subject)
    end

    it 'responds successfully with an HTTP 200 status code' do
      # battery = create(:battery)
      get :show, id: @subject.id.to_s
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

end
