require 'spec_helper'

describe Review do
  let!(:ira) { FactoryGirl.create(:host) }
  let!(:american) { FactoryGirl.create(:podcast) }
  let!(:podcast_host) { PodcastHost.create!(host: ira, podcast: american) }
  let!(:review) do
    FactoryGirl.create(:review, user: american.user, podcast: american)
  end

  describe ".new" do
    it "has a rating" do
      expect(review.rating).to eq(5)
    end
    it "has a rating" do
      expect(review.body).to eq("Great podcast!")
    end
    it "has a podcast" do
      expect(review.podcast.name).to eq("This American Life")
    end
    it "has a user" do
      expect(review.podcast.user.name).to eq("Chewy")
    end
  end
end
