require 'spec_helper'

describe Category do
  let!(:documentary) { FactoryGirl.create(:category, name: "Documentary") }

  describe ".new" do
    it "has a name" do
      expect(documentary.name).to eq("Documentary")
    end
  end
end
