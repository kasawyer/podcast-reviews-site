require 'spec_helper'

describe Review do
  let!(:user) { FactoryGirl.create(:user) }

  describe ".new" do
    it "has a name" do
      expect(user.name).to eq("Chewy")
    end
    it "has a password" do
      expect(user.password).to eq("password")
    end
    it "has a password confirmation" do
      expect(user.password_confirmation).to eq("password")
    end
    it "has an email" do
      expect(user.email).to eq("chewy@gmail.com")
    end
  end
end
