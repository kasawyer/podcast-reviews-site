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
    ira = Host.create!(first_name: "Ira", last_name: "Glass")
    politics = Category.create!(name: "Politics")

    fresh_air = Podcast.create!(name: "Fresh Air", provider: npr, description: \
    "A show about politics")
    visit podcast_path(fresh_air)

    expect(page).to have_content("Fresh Air")
    expect(page).to have_content("NPR")
  end

  scenario "Link to index page" do
    npr = Provider.create!(name: "NPR")
    ira = Host.create!(first_name: "Ira", last_name: "Glass")
    politics = Category.create!(name: "Politics")

    fresh_air = Podcast.create!(name: "Fresh Air", provider: npr, description: \
    "A show about politics")
    visit podcast_path(fresh_air)
    click_on "Back"

    expect(page).to have_content("Podcasts")
  end
end
