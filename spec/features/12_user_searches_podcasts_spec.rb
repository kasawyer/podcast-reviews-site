require 'spec_helper'

feature "user searches podcasts" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:provider) { FactoryGirl.create(:provider) }
  let!(:american) do
    FactoryGirl.create(:podcast, provider: provider, user: user)
  end
  let!(:italian) do
    FactoryGirl.create(
      :podcast,
      name: "This Italian Life",
      provider: provider,
      user: user
    )
  end

  let!(:fresh) do
    FactoryGirl.create(
      :podcast,
      name: "Fresh Air",
      provider: provider,
      user: user
    )
  end

  scenario "user searches for a term with multiple matches" do
    visit "/"
    fill_in "Search Podcasts", with: "life"
    click_on "Search"

    expect(page).to have_content "This American Life"
    expect(page).to have_content "This Italian Life"
    expect(page).to_not have_content "Fresh Air"
  end

  scenario "user searches for a term with no matches" do
    visit "/"
    fill_in "Search Podcasts", with: "chewbacca"
    click_on "Search"

    expect(page).to have_content "No results matched your search."
    expect(page).to_not have_content "This American Life"
    expect(page).to_not have_content "This Italian Life"
    expect(page).to_not have_content "Fresh Air"
  end

  scenario "user does not enter a search term" do
    visit "/"
    click_on "Search"

    expect(page).to have_content "Please enter search terms."
    expect(page).to_not have_content "This American Life"
    expect(page).to_not have_content "This Italian Life"
    expect(page).to_not have_content "Fresh Air"
  end
end
