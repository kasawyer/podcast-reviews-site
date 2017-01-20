require 'spec_helper'

feature "user can edit and delete podcasts" do
  let!(:npr) { Provider.create(name: "NPR") }
  let!(:terry) { Host.create(name: "Teri Gross") }
  let!(:comedy) { Category.create(name: 'Comedy') }
  let!(:documentary) { Category.create(name: 'Documentary') }
  let!(:fresh_air) do
    Podcast.create(
      name: "Fresh Air",
      provider: npr,
      description: "Awesome interviews with interesting people"
    )
  end

  scenario "user edits a podcast" do
    visit "/"
    click_on "Fresh Air"
    click_on "Edit"

    fill_in "Name", with: "Reply All"
    fill_in "Provider", with: "Gimlet Media"
    fill_in "Description", with: "It's about the internet, and so much more"
    within('.host') do
      fill_in 'podcast_hosts_attributes_0_name', with: 'PJ Vogt'
      fill_in 'podcast_hosts_attributes_1_name', with: 'Alex Goldman'
    end
    fill_in 'Release year', with: "2017"
    fill_in 'SoundCloud link', with: "https://soundcloud.com/"
    fill_in 'iTunes link', with: "http://www.apple.com/itunes"
    check 'Documentary'
    check 'Comedy'

    click_on "Update podcast"

    expect(page).to have_content "Podcast updated successfully."
    expect(page).to have_content "Reply All"
    expect(page).to have_content "Gimlet Media"
    expect(page).to have_content "It's about the internet, and so much more"
    expect(page).to have_content "PJ Vogt"
    expect(page).to have_content "Alex Goldman"
    expect(page).to have_content "2017"
    expect(page).to have_content "https://soundcloud.com/"
    expect(page).to have_content "http://www.apple.com/itunes"
  end
  scenario "user deletes a podcast" do
    visit "/"
    click_on "Fresh Air"
    click_on "Delete"

    expect(page).to have_content "Podcast was successfully deleted."
  end
end
