# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  scenario 'can post a message' do
    sign_up
    submit_post
    expect(current_path).to eq('/')
    expect(page).to have_content('Here is a message')
  end

  scenario 'redirected if attempt to visit new post page when not logged in' do
    visit '/post/new'
    expect(current_path).to eq('/user/sign_in')
  end

  scenario 'redirected if attempt to create post before any communities exist' do
    sign_up
    visit '/post/new'
    expect(current_path).to eq('/communities/new')
    expect(page).to have_content('No Communities exist yet. Please create a community first.')
  end

  scenario 'post includes the username of user who posted' do
    sign_up
    submit_post
    expect(page).to have_content('Posted by u/example')
  end

  scenario 'redirected if attempt is made to create post without a community' do
    sign_up
    create_community
    visit '/post/new'
    fill_in 'post[message]', with: 'Here is a message'
    click_button 'Submit'
    expect(page).to have_content('Post unsuccessful. Please make sure you have selected a community.')
  end
end
