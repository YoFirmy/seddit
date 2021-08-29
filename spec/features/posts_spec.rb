require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  scenario "can post a message" do
    sign_up
    submit_post
    expect(current_path).to eq('/')
    expect(page).to have_content("Here is a message")
  end

  scenario "redirected if attempt to visit new post page when not logged in" do
    visit "/post/new"
    expect(current_path).to eq('/user/sign_in')
  end

  scenario "post includes the username of user who posted" do
    sign_up
    submit_post
    expect(page).to have_content("submitted by example")
  end
end
