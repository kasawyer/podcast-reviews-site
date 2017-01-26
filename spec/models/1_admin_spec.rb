require 'spec_helper'

describe Admin do
  let!(:admin) { FactoryGirl.create(:admin ) }

  describe ".new" do
    it "has a name" do
      expect(admin.name).to eq("Luke")
    end

    it "has a password" do
      expect(admin.password).to eq("theforce")
    end

    it "has an email" do
      expect(admin.email).to eq("iamyourson@gmail.com")
    end
  end
end
