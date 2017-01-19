require 'spec_helper'

feature "User creates an account" do

  scenario "user signs up for new account successfully" do
    visit "/"
    click_on "Sign up"

    fill_in "Email", with: "rk2211@gmail.com"
    fill_in "Password", with: "chewbacca"
    fill_in "Password confirmation", with: "chewbacca"

    click_button "Sign up"

    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  scenario "user tries to create an account with an unavailable email" do
    User.create!(email: "rk2211@gmail.com", password: "chewbacca")

    visit "/"

    click_on "Sign up"

    fill_in "Email", with: "rk2211@gmail.com"
    fill_in "Password", with: "chewbacca"
    fill_in "Password confirmation", with: "chewbacca"
# save_and_open_page
    click_button "Sign up"

    expect(page).to have_content "Email has already been taken"
  end

  scenario "user tries to create an account with invalid email format" do
    visit "/"
    click_on "Sign up"

    fill_in "Email", with: "rk2211gmail.com"
    fill_in "Password", with: "chewbacca"
    fill_in "Password confirmation", with: "chewbacca"

    click_button "Sign up"

    expect(page).to have_content "Email is invalid"
  end

  scenario "user tries to create an account without email or password" do
    visit "/"
    click_on "Sign up"
    fill_in "Email", with: ""

    click_button "Sign up"

    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Password can't be blank"
  end

  scenario "user can sign in again after creating an account" do
    User.create!(email: "rk2211@gmail.com", password: "chewbacca")

    visit "/"
    click_on "Sign in"

    fill_in "Email", with: "rk2211@gmail.com"
    fill_in "Password", with: "chewbacca"

    click_button "Sign in"

    expect(page).to have_content "Signed in successfully"
    expect(page).to have_content "Signed in as rk2211@gmail.com"
    expect(page).to have_content "Sign out"
  end

  scenario "user can sign out" do
    User.create!(email: "rk2211@gmail.com", password: "chewbacca")

    visit "/"
    click_on "Sign in"

    fill_in "Email", with: "rk2211@gmail.com"
    fill_in "Password", with: "chewbacca"

    click_button "Sign in"

    click_on "Sign out"
    expect(page).to have_content "Sign in"
  end

  scenario "user can't sign in with invalid email format" do
    visit '/'
    click_on "Sign in"

    fill_in "Email", with: "rk2211gmail.com"
    fill_in "Password", with: "chewbacca"

    click_button 'Sign in'
    expect(page).to have_content "Invalid Email or password"
  end
end
