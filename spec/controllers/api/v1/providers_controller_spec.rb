require "rails_helper"

RSpec.describe Api::V1::ProvidersController, type: :controller do
  let!(:american) do
    FactoryGirl.create(:podcast)
  end

  describe "GET#index" do
    it "should return the provider for a given podcast" do
      get :index, podcast_id: 4
      json = JSON.parse(response.body)

      expect(json["name"]).to eq("NPR")
    end
  end
end
