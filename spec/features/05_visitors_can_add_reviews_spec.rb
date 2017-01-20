require 'rails_helper'

feature 'visitors can add reviews' do
  let! (:npr) { Provider.create(name: "NPR") }
  let! (:fresh_air) { Podcast.create(name: "Fresh Air", provider: npr) }
  let! (:user) do
    User.create(
      email: "person@gmail.com",
      password: "password",
      name: "Person"
    )
  end

  scenario 'visitor adds new review successfully' do
    visit new_user_session_path

    fill_in "Email", with: "person@gmail.com"
    fill_in "Password", with: "password"

    click_button "Sign in"

    visit podcast_path(fresh_air)
    expect(page).to have_content 'Add a review:'

    fill_in 'Rating', with: 5
    fill_in 'Review', with: 'Such a great podcast!'

    click_button 'Add review'

    expect(page).to have_content 'Review added successfully'
    expect(page).to have_content '5'
    expect(page).to have_content 'Such a great podcast!'
  end

  scenario 'visitor does not provide necessary information for review' do
    visit podcast_path(fresh_air)
    expect(page).to have_content 'Add a review:'

    fill_in 'Rating', with: ''
    fill_in 'Review', with: ''

    click_button 'Add review'

    expect(page).to have_content "Rating can't be blank, Rating is not a number,
      and Body can't be blank"
  end
end
