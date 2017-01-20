require 'spec_helper'

feature "User edits an account" do
  # let!(:chewy) { User.create(name: 'Chewy', email: "chewsalot@gmail.com", password: "harrylove") }

  scenario "user successfully edits an account" do
    visit '/'
    click_on "Sign up"

    fill_in "Name", with: "Chewy"
    fill_in "Email", with: "chewsalot@gmail.com"
    fill_in "Password", with: "harrylove"
    fill_in "Password confirmation", with: "harrylove"
    attach_file('user_avatar', Rails.root + 'spec/images/chewbacca.jpg')
    click_button "Sign up"
    click_on "Account settings"
    fill_in "Name", with: "Chews"
    fill_in "Email", with: "chewylouis@gmail.com"
    attach_file('user_avatar', Rails.root + "spec/images/luke.png")
    fill_in "Current password", with: "harrylove"

    click_button "Update"

    expect(page).to have_content "Your account has been updated successfully."
  end
end
