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

  scenario 'visitor deletes review successfully' do
    visit new_user_session_path

    fill_in "Email", with: "person@gmail.com"
    fill_in "Password", with: "password"

    click_button "Sign in"

    visit podcast_path(fresh_air)
    expect(page).to have_content 'Add a review:'
    expect(page).to have_content '5: Great podcast!'

    click_on 'Delete'

    expect(page).to have_content 'Add a review:'
    expect(page).not_to have_content '5: Great podcast!'
  end
end
