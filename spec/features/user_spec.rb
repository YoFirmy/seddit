# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  scenario 'can sign up' do
    sign_up
    expect(current_path).to eq('/')
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'can log out' do
    sign_up
    click_link 'Log Out'
    expect(current_path).to eq('/')
    expect(page).to have_content('Signed out successfully.')
  end

  scenario 'can log out' do
    sign_up
    click_link 'Log Out'
    visit '/user/sign_in'
    fill_in 'user[email]', with: 'example@example.com'
    fill_in 'user[password]', with: 'example'
    click_button 'Log in'
    expect(current_path).to eq('/')
    expect(page).to have_content('Signed in successfully.')
  end
end
