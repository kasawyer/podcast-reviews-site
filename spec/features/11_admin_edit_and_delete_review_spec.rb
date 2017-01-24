require 'spec_helper'

feature "admin can edit and delete reviews" do
  let!(:ira) { FactoryGirl.create(:host) }
  let!(:comedy) { FactoryGirl.create(:category) }
  let!(:documentary) { FactoryGirl.create(:category, name: "Documentary") }
  let!(:american) { FactoryGirl.create(:podcast) }
  let!(:podcast_host) { PodcastHost.create!(host: ira, podcast: american) }
  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:review) do
    FactoryGirl.create(:review, user: american.user, podcast: american)
  end

  xscenario "admin edits a review" do
    visit new_admin_session_path

    fill_in "Email", with: "iamyourson@gmail.com"
    fill_in "Password", with: "theforce"

    click_button "Sign in"

    visit "/"
    click_on "This American Life"
    within("#review#{review.id}") do
      click_on 'Edit'
    end

    fill_in 'Rating (1 - 5)', with: '4'
    fill_in "Review", with: "Good!"

    click_button 'Submit review'

    expect(page).to have_content "Review updated successfully"
    expect(page).to have_content "Good!"
    expect(page).to have_content "4"
  end

  xscenario "admin deletes a review" do
    visit new_admin_session_path

    fill_in "Email", with: "iamyourson@gmail.com"
    fill_in "Password", with: "theforce"

    click_button "Sign in"

    visit "/"
    click_on "This American Life"
    within("#review#{review.id}") do
      click_on 'Delete'
    end

    visit podcast_path(american.id)

    expect(page).not_to have_content "Good!"
  end
end
