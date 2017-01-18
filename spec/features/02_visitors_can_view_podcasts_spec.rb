require "rails_helper"

feature "user visits home page" do
  scenario "user sees names of all podcasts" do
    npr = Provider.create!(name: "NPR")
    launch = Provider.create!(name: "Launch Academy")

    Podcast.create!(name: "This American Life", provider: npr, description: "Ira Glass doing what he does best - telling us great stories.")
    Podcast.create!(name: "Serial", provider: npr, description: "Great murder mystery.")
    Podcast.create!(name: "Fiesta Parrot", provider: launch, description: "Just a cool group of coding friends chattin' about life. The best podcast ever.")

    visit "/podcasts"

    expect(page).to have_content "This American Life"
    expect(page).to have_content "NPR"
    expect(page).to have_content "Serial"
    expect(page).to have_content "NPR"
    expect(page).to have_content "Fiesta Parrot"
    expect(page).to have_content "Launch Academy"
  end

  xscenario "podcasts are listed in descending order based on most recent reviews" do

  end
end
