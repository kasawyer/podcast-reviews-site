require 'rails_helper'

feature 'visitors can add reviews' do
  let!(:american) { FactoryGirl.create(:podcast) }


  scenario 'visitor adds new review successfully' do
    visit new_user_session_path

    fill_in "Email", with: "chewy@gmail.com"
    fill_in "Password", with: "password"

    click_button "Sign in"

    visit podcast_path(american)

    expect(page).to have_content 'Add a review'

    fill_in 'Rating', with: 5
    fill_in 'Review', with: 'Such a great podcast!'

    click_button 'Add review'

    expect(page).to have_content 'Review added successfully'

    visit podcast_path(american)
    expect(page).to have_content '5'
    expect(page).to have_content 'Such a great podcast!'
    expect(page).to have_content 'Chewy'
  end

  scenario 'visitor does not provide necessary information for review' do
    visit new_user_session_path

    fill_in "Email", with: "chewy@gmail.com"
    fill_in "Password", with: "password"

    click_button "Sign in"
    visit podcast_path(american)
    expect(page).to have_content 'Add a review'

    fill_in 'Rating', with: ''
    fill_in 'Review', with: ''

    click_button 'Add review'

    expect(page).to have_content "Rating can't be blank, Rating is not a number, Rating must be between 1 - 5, and Body can't be blank"
  end
end
