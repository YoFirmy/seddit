# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Navbar', type: :feature do
  context 'User is not logged in' do
    scenario 'Log out link does not display' do
      visit '/'
      expect(page).to have_no_link('Log Out')
    end

    scenario 'Log-in and Sign-up links do display' do
      visit '/'
      expect(page).to have_link('Log In')
      expect(page).to have_link('Sign Up')
    end
  end

  context 'User is logged in' do
    before(:each) do
      sign_up
    end

    scenario 'Log out link displays' do
      expect(page).to have_link('Log Out')
    end

    scenario 'Log-in and Sign-up links do not display' do
      expect(page).to have_no_link('Log In')
      expect(page).to have_no_link('Sign Up')
    end
  end
end
