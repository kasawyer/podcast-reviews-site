require 'rails_helper'

feature 'visitors can edit reviews' do
  let! (:npr) { Provider.create(name: "NPR") }
  let! (:fresh_air) { Podcast.create(name: "Fresh Air", provider: npr) }
  let! (:user) do
    User.create(
      email: "person@gmail.com",
      password: "password",
      name: "Person"
    )
  end
  let! (:review) do
    Review.create(
      rating: 5,
      body: "Great podcast!",
      user: user,
      podcast: fresh_air
    )
  end

  scenario 'visitor edits review successfully' do
    visit new_user_session_path

    fill_in "Email", with: "person@gmail.com"
    fill_in "Password", with: "password"

    click_button "Sign in"

    visit podcast_path(fresh_air)
    expect(page).to have_content 'Add a review:'
    expect(page).to have_content '5: Great podcast!'

    within("#review#{review.id}") do
      click_on 'Edit'
    end

    expect(page).to have_content 'Edit review:'

    fill_in 'Rating', with: 4
    fill_in 'Review', with: 'Pretty good podcast!'

    click_button 'Submit review'

    expect(page).to have_content 'Review updated successfully'
    expect(page).to have_content '4'
    expect(page).to have_content 'Pretty good podcast!'
  end

  scenario 'visitor does not provide necessary information for review update' do
    visit podcast_path(fresh_air)

    expect(page).to have_content 'Add a review:'
    expect(page).to have_content '5: Great podcast!'

    within("#review#{review.id}") do
      click_on 'Edit'
    end
    expect(page).to have_content 'Edit review:'

    fill_in 'Rating', with: ''
    fill_in 'Review', with: ''

    click_button 'Submit review'

    expect(page).to have_content "Rating can't be blank, Rating is not a \
      number, Rating must be between 1 - 5, and Body can't be blank"
  end
end
