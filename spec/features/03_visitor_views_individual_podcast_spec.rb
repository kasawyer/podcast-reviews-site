require 'spec_helper'

feature "User visits a podcast" do

  scenario "user visits show page for Fresh Air" do
    npr = Provider.create!(name: "NPR")
    fresh_air = Podcast.create!(
      name: "Fresh Air",
      provider: npr,
      description: "A show about politics",
      release_year: 2009,
      soundcloud_url: "https://soundcloud.com/",
      itunes_url: "http://www.apple.com/itunes"
    )
    ira = Host.create!(name: "Ira Glass")
    politics = Category.create!(name: "Politics")
    PodcastHost.create!(host: ira, podcast: fresh_air)
    Categorization.create!(category: politics, podcast: fresh_air)

    visit podcast_path(fresh_air)

    expect(page).to have_content("Fresh Air")
    expect(page).to have_content("NPR")
    expect(page).to have_content("A show about politics")
    expect(page).to have_content("Ira Glass")
    expect(page).to have_content("Politics")
    expect(page).to have_content("2009")
    expect(page).to have_content("https://soundcloud.com/")
    expect(page).to have_content("http://www.apple.com/itunes")
  end

  scenario "Link to index page" do
    npr = Provider.create!(name: "NPR")

    fresh_air = Podcast.create!(name: "Fresh Air", provider: npr, description: \
    "A show about politics")
    visit podcast_path(fresh_air)
    click_on "Back"

    expect(page).to_not have_content("A show about politics")
    expect(page).to have_content("Podcasts")
  end
end
