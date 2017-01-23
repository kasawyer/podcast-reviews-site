require 'spec_helper'

feature "User edits an account" do
  let!(:user) { FactoryGirl.create(:user) }

  scenario "user successfully edits an account" do
    visit "/"
    click_on "Sign in"

    fill_in "Email", with: "chewy@gmail.com"
    fill_in "Password", with: "password"

    click_button "Sign in"
    click_on "Account settings"

    fill_in "Name", with: "Chews"
    fill_in "Email", with: "chewylouis@gmail.com"
    attach_file('user_avatar', Rails.root + "spec/images/luke.png")
    fill_in "Current password", with: "password"

    click_button "Update"

    expect(page).to have_content "Your account has been updated successfully."

    click_on "Account settings"

    expect(find_field('Name').value).to eq 'Chews'
    expect(find_field('Email').value).to eq 'chewylouis@gmail.com'
  end

  scenario "user successfully delete an account" do
    visit "/"
    click_on "Sign in"

    fill_in "Email", with: "chewy@gmail.com"
    fill_in "Password", with: "password"

    click_button "Sign in"
    click_on "Account settings"

    click_button "Delete account"

    expect(page).to have_content "Bye! Your account has been successfully
      cancelled. We hope to see you again soon."
  end

  scenario "user successfully has changed a password" do
    visit "/"
    click_on "Sign in"

    fill_in "Email", with: "chewy@gmail.com"
    fill_in "Password", with: "password"

    click_button "Sign in"
    click_on "Account settings"

    fill_in "New password", with: "furry123"
    fill_in "Confirm new password", with: "furry123"
    fill_in "Current password", with: "password"

    click_button "Update"

    expect(page).to have_content "Your account has been updated successfully."
  end

  scenario "user successfully has changed a password" do
    visit "/"
    click_on "Sign in"

    fill_in "Email", with: "chewy@gmail.com"
    fill_in "Password", with: "password"

    click_button "Sign in"
    click_on "Account settings"

    fill_in "New password", with: "furry123"
    fill_in "Confirm new password", with: "furry123"
    fill_in "Current password", with: "password"

    click_button "Update"

    expect(page).to have_content "Your account has been updated successfully."

    click_on "Account settings"

    fill_in "Current password", with: "furry123"

    click_button "Update"

    expect(page).to have_content "Your account has been updated successfully."
  end
end
