require "rails_helper"

feature "user visits home page" do
  xscenario "user sees names of all podcasts" do
    launch = FactoryGirl.create(:provider, name: "Launch Academy")
    gimlet = FactoryGirl.create(:provider, name: "Gimlet Media")
    listener1 = FactoryGirl.create(:user, email: "chewy1@gmail.com")
    listener2 = FactoryGirl.create(:user, email: "chewy2@gmail.com")
    FactoryGirl.create(:podcast)
    FactoryGirl.create(:podcast, name: "Reply All", user: listener1, provider:
     gimlet)
    FactoryGirl.create(:podcast,
      name: "Fiesta Parrot",
      user: listener2,
      provider: launch)

    visit "/podcasts"

    expect(page).to have_content "This American Life"
    expect(page).to have_content "NPR"
    expect(page).to have_content "Reply All"
    expect(page).to have_content "Gimlet Media"
    expect(page).to have_content "Fiesta Parrot"
    expect(page).to have_content "Launch Academy"
  end

  xscenario "podcasts are listed in alphabetical order" do

  end
end
