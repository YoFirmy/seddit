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
end
