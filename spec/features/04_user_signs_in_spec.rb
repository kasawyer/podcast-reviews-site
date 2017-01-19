require 'spec_helper'

feature "User creates an account" do

  scenario "user signs up for new account" do
    visit new_user_registration_path

    fill_in "Name", with: "Chewy"
    fill_in "Email", with: "rk2211@gmail.com"
    fill_in "Password", with: "chewbacca"
    fill_in "Password confirmation", with: "chewbacca"

    click_on "Sign up"

    expect(page).to have_content "Podcasts"
  end

  scenario "user tries to create an account with an unavailable email" do
    User.create!(name: "Chewy", email: "rk2211@gmail.com", password: "chewbacca")

    visit new_user_registration_path

    fill_in "Name", with: "Chewy"
    fill_in "Email", with: "rk2211@gmail.com"
    fill_in "Password", with: "chewbacca"
    fill_in "Password confirmation", with: "chewbacca"

    click_on "Sign up"

    expect(page).to have_content "Email has already been taken"
  end

  scenario "user tries to create an account without email or password" do
    visit new_user_registration_path

    click_on "Sign up"

    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Password can't be blank"
  end

  scenario "user can sign in again after creating an account" do
    User.create!(name: "Chewy", email: "rk2211@gmail.com", password: "chewbacca")

    visit new_user_session_path

    fill_in "Email", with: "rk2211@gmail.com"
    fill_in "Password", with: "chewbacca"

    click_on "Log in"

    expect(page).to have_content "Signed in successfully"
  end

  scenario "user can't sign in with invalid email format" do
    visit new_user_registration_path

    fill_in "Name", with: "Chewy"
    fill_in "Email", with: "rk2211gmail.com"
    fill_in "Password", with: "chewbacca"
    fill_in "Password confirmation", with: "chewbacca"

    click_on "Sign up"

    expect(page).to have_content "Email is invalid"
  end
end
