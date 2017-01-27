require 'spec_helper'

describe Host do
  let!(:host) { FactoryGirl.create(:host) }

  describe ".new" do
    it "has a name" do
      expect(host.name).to eq("Ira Glass")
    end
  end
end
