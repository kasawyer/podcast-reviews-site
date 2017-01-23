require "rails_helper"

feature "user visits home page" do
  scenario "user sees names of all podcasts" do
    launch = FactoryGirl.create(:provider, name: "Launch Academy")
    gimlet = FactoryGirl.create(:provider, name: "Gimlet Media")
    FactoryGirl.create(:podcast)
    FactoryGirl.create(:podcast, name: "Reply All", provider: gimlet)
    FactoryGirl.create(:podcast, name: "Fiesta Parrot", provider: launch)

    visit "/podcasts"

    expect(page).to have_content "This American Life"
    expect(page).to have_content "NPR"
    expect(page).to have_content "Reply All"
    expect(page).to have_content "Gimlet Media"
    expect(page).to have_content "Fiesta Parrot"
    expect(page).to have_content "Launch Academy"
  end

  xscenario "podcasts are listed in descending order based on most recent
    reviews" do

  end
end
