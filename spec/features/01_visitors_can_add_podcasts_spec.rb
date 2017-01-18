require 'rails_helper'

feature 'visitors can add podcasts' do
  let!(:comedy) { Category.create(name: 'Comedy') }
  let!(:documentary) { Category.create(name: 'Documentary') }

  scenario 'visitor adds new podcast successfully' do
    visit new_podcast_path
    expect(page).to have_content 'Add a podcast:'

    fill_in 'Name', with: 'Fiesta Parrot'
    fill_in 'Description', with: "Just a cool group of coding friends chattin'
      about life. The best podcast ever."
    check 'Documentary'
    check 'Comedy'
    fill_in 'Release year', with: 2017
    fill_in 'Provider', with: 'Launch Academy'
    fill_in 'Host', with: 'MRKD'
    fill_in 'Additional host', with: 'Launch'

    click_button 'Add podcast'

    expect(page).to have_content 'Podcast added successfully'
    expect(page).to have_content 'Fiesta Parrot'
    expect(page).to have_content 'Launch Academy'
  end

  scenario "user submits a podcast with the name 'Howard Stern Show'" do
    visit new_podcast_path
    fill_in 'Name', with: 'Howard Stern Show'
    fill_in 'Provider', with: 'Sirius XM'
    fill_in 'Description', with: 'Simply disgusting.'
    fill_in 'Release year', with: '1995'
    fill_in 'Host', with: 'Howard Stern'
    check 'Comedy'
    fill_in 'iTunes link', with: 'http://www.itunes.com/stern'
    click_button 'Add podcast'

    expect(page).to have_content 'Podcasts'
    expect(page).to have_content 'Howard Stern Show'
  end

  scenario 'visitor does not provide proper information for a podcast' do
    visit new_podcast_path

    click_button 'Add podcast'
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Provider can't be blank"
  end

  scenario 'user submits an incomplete entry with no provider' do
    visit new_podcast_path
    fill_in 'Name', with: 'Howard Stern Show'
    click_button 'Add podcast'

    expect(page).to have_content 'Add a podcast'
    expect(page).to have_content "Provider can't be blank"
  end

  scenario 'user submits duplicate podcast-provider pair' do
    npr = Provider.create!(name: 'NPR')
    Podcast.create!(name: 'This American Life', provider: npr)

    visit new_podcast_path
    fill_in 'Name', with: 'This American Life'
    fill_in 'Provider', with: 'NPR'
    click_button 'Add podcast'

    expect(page).to have_content('Name has already been taken')
  end
end
