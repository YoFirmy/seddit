require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  scenario "can post a message" do
    visit "/post/new"
    fill_in "post[message]", with: "Here is a message"
    click_button "Submit"
    expect(current_path).to eq('/')
    expect(page).to have_content("Here is a message")
  end
end
