require 'rails_helper'

describe V1::CityService do
  describe "#create_city_content" do
    let!(:city) { create(:city) }
    let!(:file) { fixture_file_upload(Rails.root + 'spec/fixtures/files/foo.json') }

    it "creates city activities and activity embedded models (opening_days and position)" do
      expect {
        V1::CityService.create_city_content(city, file)
      }.to change(city.activities, :count).by(2) and change(city.activities.first.opening_days, :count).by(7) and change(city.activities.first.position, :count).by(1)
    end
  end
end
