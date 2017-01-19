require 'spec_helper'

feature "User creates an account", %(
As a User
I want to create an account on the Podcast site
So that I can add and edit reviews (later)

Acceptance Criteria:
[x] When I go to the user sign-up page, I see sign-up options
[x] After I sign up, I am redirected to the podcasts index page
[x] Email must be unique
[x] Email and password can't be blank
[] Email must be valid
[] When I want to sign in, the site recognizes my username and password
) do

    scenario "user signs up for new account" do
      visit new_user_registration_path

      fill_in "Email", with: "rk2211@gmail.com"
      fill_in "Password", with: "chewbacca"
      fill_in "Password confirmation", with: "chewbacca"

      click_on "Sign up"

      expect(page).to have_content "Podcasts"
    end

    scenario "user tries to create an account with an unavailable email" do
      User.create!(email: "rk2211@gmail.com", password: "chewbacca")

      visit new_user_registration_path

      fill_in "Email", with: "rk2211@gmail.com"
      fill_in "Password", with: "chewbacca"
      fill_in "Password confirmation", with: "chewbacca"

      click_on "Sign up"

      expect(page).to have_content "Email has already been taken"
    end

    scenario "user tries to create an account without email or password" do
      visit new_user_registration_path

      click_on "Sign up"

      expect(page).to have_content "Email can't be blank"
      expect(page).to have_content "Password can't be blank"
    end

    scenario "user can sign in again after creating an account" do
      User.create!(email: "rk2211@gmail.com", password: "chewbacca")

      visit new_user_session_path

      fill_in "Email", with: "rk2211@gmail.com"
      fill_in "Password", with: "chewbacca"

      click_on "Log in"

      expect(page).to have_content "Signed in successfully"
    end

    scenario "user can't sign in with invalid email format" do
      visit new_user_registration_path

      fill_in "Email", with: "rk2211gmail.com"
      fill_in "Password", with: "chewbacca"
      fill_in "Password confirmation", with: "chewbacca"

      click_on "Sign up"

      expect(page).to have_content "Email is invalid"
    end

    # To add: user can sign out
  end
