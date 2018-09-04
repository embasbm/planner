require 'rails_helper'

describe V1::CitiesController do
  describe "POST #create" do
    it "receives json data and creates a city" do
      @file = fixture_file_upload(Rails.root + 'spec/fixtures/files/foo.json', 'application/json')
      params = { upload: @file }
      post :create, params: params

      expect(response).to have_http_status :created
      expect(City.last.name).to eq 'foo'
    end
  end

  describe "GET #show" do
    let(:city) { create(:city) }
    it "retrieves all available activities in city" do
      get :show, params: { id: city }

      expect(response).to have_http_status :ok
      expect(JSON.parse(response.body).count).to eq 2
    end
  end
end
