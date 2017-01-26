require 'spec_helper'

describe Podcast do
  let!(:podcast) { FactoryGirl.create(:podcast) }

  describe ".new" do
    it "has a name" do
      expect(podcast.name).to eq("This American Life")
    end

    it "has a description" do
      expect(podcast.description).to eq("Ira Glass doing what he does best - \
      telling us great stories.")
    end

    it "has a release year" do
      expect(podcast.release_year).to eq(2017)
    end

    it "has an itunes url" do
      expect(podcast.itunes_url).to eq("http://www.apple.com/itunes")
    end

    it "has a soundcloud url" do
      expect(podcast.soundcloud_url).to eq("https://soundcloud.com")
    end
  end
end
