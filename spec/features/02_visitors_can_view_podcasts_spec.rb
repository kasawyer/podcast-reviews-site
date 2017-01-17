require "rails_helper"

feature "user visits home page" do
  scenario "user sees names of all podcasts" do
    Podcast.create!(name: "This American Life", provider: "NPR", description: "Ira Glass doing what he does best - telling us great stories.")
    Podcast.create!(name: "Serial", provider: "NPR", description: "Great murder mystery.")
    Podcast.create!(name: "Fiest Parrot", provider: "Launch Academy", description: "Just a cool group of coding friends chattin' about life. The best podcast ever.",
    average_length: 60, release_year: 2017, host: "MRKD")

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
