require "rails_helper"

feature "visitors can add podcasts" do
  xscenario "visitor adds new podcast successfully" do

    visit new_podcast_path
    expect(page).to have_content "Add a podcast:"

    fill_in "Name", with: "Fiesta Parrot"
    fill_in "Description", with: "Just a cool group of coding friends chattin'
      about life. The best podcast ever."
    check "Documentary"
    check "Comedy"
    fill_in "Release year", with: 2017
    fill_in "Provider", with: "Launch Academy"
    fill_in "Host", with: "MRKD"

    click_button "Add podcast"

    expect(page).to have_content "Podcast added successfully"
    expect(page).to have_content "Fiesta Parrot"
    expect(page).to have_content "Just a cool group of coding friends chattin'
      about life. The best podcast ever."
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
