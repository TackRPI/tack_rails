require 'rails_helper'

RSpec.describe BatteriesController, type: :controller do

  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #show' do

    before(:each) do
      @battery = create(:battery)
    end

    it 'responds successfully with an HTTP 200 status code' do
      # battery = create(:battery)
      get :show, id: @battery.id.to_s
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the show template" do
      # battery = create(:battery)
      get :show, id: @battery.id.to_s
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

end
