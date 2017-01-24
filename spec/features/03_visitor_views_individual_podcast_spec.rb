require 'spec_helper'

feature "User visits a podcast" do
  let!(:ira) { FactoryGirl.create(:host) }
  let!(:comedy) { FactoryGirl.create(:category) }
  let!(:american) { FactoryGirl.create(:podcast) }
  let!(:podcast_host) { PodcastHost.create!(host: ira, podcast: american) }
  let!(:cat) { Categorization.create!(category: comedy, podcast: american) }

  scenario "user visits show page for This American Life" do
    visit podcast_path(american)

    expect(page).to have_content("This American Life")
    expect(page).to have_content("NPR")
    expect(page).to have_content("Ira Glass doing what he does best -
      telling us great stories.")
    expect(page).to have_content("Ira Glass")
    expect(page).to have_content("Comedy")
    expect(page).to have_content("2017")
    expect(page).to have_link("Listen on SoundCloud", href:
     'https://soundcloud.com')
    expect(page).to have_link("Listen on iTunes", href:
     'http://www.apple.com/itunes')
  end

  scenario "Link to index page" do
    visit podcast_path(american)
    click_on "Back"

    expect(page).to_not have_content("Ira Glass doing what he does best -
      telling us great stories.")
    expect(page).to have_content("Podcasts")
  end
end
