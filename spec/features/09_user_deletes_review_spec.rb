require 'rails_helper'

feature 'visitors can delete reviews' do
  scenario 'visitor deletes review successfully' do
    review = FactoryGirl.create(:review)
    visit new_user_session_path

    fill_in "Email", with: "chewy@gmail.com"
    fill_in "Password", with: "password"

    click_button "Sign in"

    visit podcast_path(review.podcast)
    expect(page).to have_content 'Add a review'
    expect(page).to have_content '5'
    expect(page).to have_content 'Great podcast!'

    within("#review#{review.id}") do
      click_on 'Delete'
    end

    expect(page).to have_content 'Add a review'
    expect(page).not_to have_content '5'
    expect(page).not_to have_content 'Great podcast!'
  end
end
