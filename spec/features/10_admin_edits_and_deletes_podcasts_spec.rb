require 'spec_helper'

feature "user can edit and delete podcasts" do
  let!(:ira) { FactoryGirl.create(:host) }
  let!(:comedy) { FactoryGirl.create(:category) }
  let!(:documentary) { FactoryGirl.create(:category, name: "Documentary") }
  let!(:american) { FactoryGirl.create(:podcast) }
  let!(:podcast_host) { PodcastHost.create!(host: ira, podcast: american) }
  let!(:admin) { FactoryGirl.create(:admin) }

  scenario "admin edits a podcast" do
    visit new_admin_session_path

    fill_in "Email", with: "iamyourson@gmail.com"
    fill_in "Password", with: "theforce"

    click_button "Sign in"

    visit "/"
    click_on "This American Life"
    click_on "Edit"

    fill_in 'Name (required)', with: 'Reply All'
    fill_in "Provider", with: "Gimlet Media"
    fill_in "Description", with: "It's about the internet, and so much more"
    within('.host') do
      fill_in 'podcast_hosts_attributes_0_name', with: 'PJ Vogt'
      fill_in 'podcast_hosts_attributes_1_name', with: 'Alex Goldman'
    end
    fill_in 'Release year', with: "2015"
    fill_in 'SoundCloud link', with: "https://soundcloud.com/replyall"
    fill_in 'iTunes link', with: "https://itunes.apple.com/us/podcast/reply-all"
    check 'Documentary'
    check 'Comedy'

    click_on "Update podcast"

    expect(page).to have_content "Podcast updated successfully."
    expect(page).to have_content "Reply All"
    expect(page).to have_content "Gimlet Media"
    expect(page).to have_content "It's about the internet, and so much more"
    expect(page).to have_content "PJ Vogt"
    expect(page).to have_content "Alex Goldman"
    expect(page).to have_content "2015"
    expect(page).to have_link("Reply All", href: 'https://soundcloud.com/replyall')
    expect(page).to have_link("Reply All", href: 'https://itunes.apple.com/us/podcast/reply-all')
  end

  scenario "user deletes a podcast" do
    visit new_admin_session_path

    fill_in "Email", with: "iamyourson@gmail.com"
    fill_in "Password", with: "theforce"

    click_button "Sign in"

    visit "/"
    click_on "This American Life"
    click_on "Delete"

    visit "/"

    expect(page).not_to have_content "This American Life"
  end
end
