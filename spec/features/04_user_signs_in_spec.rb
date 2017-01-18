require 'spec_helper'

feature "User creates an account and signs in", %(
As a User
I want to create an account on the Podcast site
So that I can add and edit reviews (later)

Acceptance Criteria:
[] When I go to the user sign-up page, I see sign-up options
[] When I want to sign in, the site recognizes my username and password
[] Username, password and email must each be unique
[] There is a link back to the index page
) do

  scenario "user signs up for new account" do
    visit new_user_registration_path
    expect(page).to have_content("Email")
  end

  end
