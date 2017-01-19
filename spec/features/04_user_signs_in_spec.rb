require 'spec_helper'

feature "User creates an account", %(
As a User
I want to create an account on the Podcast site
So that I can add and edit reviews (later)

Acceptance Criteria:
[] When I go to the user sign-up page, I see sign-up options
[] Username, password and email must each be unique
[] There is a link back to the index page
[] When I want to sign in, the site recognizes my username and password
) do

    scenario "user signs up for new account" do
      visit new_user_registration_path

      fill_in "Email", with: "rk2211@gmail.com"
      fill_in "Password", with: "hairylove1"
      fill_in "Password confirmation", with: "hairylove1"

      click_on "Sign up"


    end

  end
