require 'spec_helper'

feature "User visits a podcast", %(
As a User
I want to visit a podcast I clicked on to see the details

Acceptance Criteria:
[x] When I click on podcast, I go to a page that shows the descriptions of the\
podcast.
[x] There is a link back to the index page.
) do

  scenario "user visits show page for Fresh Air" do
    npr = Provider.create!(name: "NPR")
    fresh_air = Podcast.create!(name: "Fresh Air", provider: npr, description: \
    "A show about politics")
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
