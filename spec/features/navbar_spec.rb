require 'rails_helper'

RSpec.feature "Navbar", type: :feature do
  context "User is not logged in" do
    scenario "Log out button does not display" do
      visit "/"
      expect(page).to have_no_button('Log Out')
    end

    scenario "Log-in and Sign-up buttons do display" do
      visit "/"
      expect(page).to have_button('Log In')
      expect(page).to have_button('Sign Up')
    end
  end

  context "User is logged in" do
    before(:each) do
      sign_up
    end

    scenario "Log out button displays" do
      expect(page).to have_button('Log Out')
    end

    scenario "Log-in and Sign-up buttons do not display" do
      expect(page).to have_no_button('Log In')
      expect(page).to have_no_button('Sign Up')
    end
  end
end
