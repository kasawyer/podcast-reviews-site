require 'spec_helper'

describe Provider do
  let!(:provider) { FactoryGirl.create(:provider) }

  describe ".new" do
    it "has a name" do
      expect(provider.name).to eq("NPR")
    end
  end
end
