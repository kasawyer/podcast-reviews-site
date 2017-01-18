require "rails_helper"

# [] A podcast must have a name, and provider. It can optionally have a description, category, host, release year, link to listen on iTunes, and a link to listen on SoundCloud.
# [] Visiting the `/podcasts/new` path should display a form for creating a new podcast.
# [] When adding a new podcast, if I fill out the form correctly, I should see the page for the newly created podcast.
# [] When adding a new podcast, if I fill out the form incorrectly and submit the form, I should see the form and be displayed the validation errors.


feature "visitors can add podcasts" do
  xscenario "visitor adds new podcast successfully" do

    visit new_podcast_path
    expect(page).to have_content "Add a podcast:"

    fill_in "Name", with: "Fiesta Parrot"
    fill_in "Description", with: "Just a cool group of coding friends chattin' about life. The best podcast ever."
    check "Documentary"
    check "Comedy"
    fill_in "Release year", with: 2017
    fill_in "Provider", with: "Launch Academy"
    fill_in "Host", with: "MRKD"

    click_button "Add podcast"

    expect(page).to have_content "Podcast added successfully"
    expect(page).to have_content "Fiesta Parrot"
    expect(page).to have_content "Just a cool group of coding friends chattin' about life. The best podcast ever."
    expect(page).to have_content "Documentary"
    expect(page).to have_content "Comedy"
    expect(page).to have_content "2017"
    expect(page).to have_content "Launch Academy"
    expect(page).to have_content "MRKD"
  end

  xscenario "visitor does not provide proper information for a podcast" do
    visit new_podcast_path

    click_button "Add podcast"
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Provider can't be blank"
  end
end
