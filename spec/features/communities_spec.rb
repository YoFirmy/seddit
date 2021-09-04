# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Communities', type: :feature do
  scenario 'can create a community' do
    create_community
    expect(current_path).to match(%r{/communities/\d+})
    expect(page).to have_content('s/test_community')
    expect(page).to have_content('Community created successfully.')
  end

  scenario 'can not create a community with the same name as one that already exists' do
    2.times { create_community }
    expect(current_path).to eq('/communities/new')
    expect(page).to have_content('That community already exists.')
  end

  scenario 'show the post posted to that community' do
    sign_up
    submit_post
    click_link 's/test_community'
    expect(current_path).to match(%r{/communities/\d+})
    expect(page).to have_content('Here is a message')
  end

  scenario 'does not show posts to other communities' do
    sign_up
    submit_post
    submit_post_to_second_community
    click_link 's/test_community'
    expect(current_path).to match(%r{/communities/\d+})
    expect(page).not_to have_content('Here is a message to the second community')
  end
end