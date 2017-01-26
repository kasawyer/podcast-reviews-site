require "rails_helper"

RSpec.describe Api::V1::PodcastsController, type: :controller do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:provider) { FactoryGirl.create(:provider) }
  let!(:american) do
    FactoryGirl.create(:podcast, provider: provider, user: user)
  end
  let!(:italian) do
    FactoryGirl.create(
    :podcast,
    name: "This Italian Life",
    provider: provider,
    user: user,
    release_year: 2010
    )
  end
  let!(:fresh) do
    FactoryGirl.create(
    :podcast,
    name: "Fresh Air",
    provider: provider,
    user: user
    )
  end

  describe "GET #index" do
    it "should return all podcasts" do
      get :index
      json = JSON.parse(response.body)
      expect(json.length).to eq(3)
      expect(json[0]["name"]).to eq("This American Life")
      expect(json[0]["description"]).to eq("Ira Glass doing what he does best - telling us great stories.")
      expect(json[1]["release_year"]).to eq(2010)
      expect(json[1]["itunes_url"]).to eq("http://www.apple.com/itunes")
      expect(json[2]["soundcloud_url"]).to eq("https://soundcloud.com")
    end
  end
end
