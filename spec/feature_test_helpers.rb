# frozen_string_literal: true

def sign_up
  visit '/user/sign_up'
  fill_in 'user[username]', with: 'example'
  fill_in 'user[email]', with: 'example@example.com'
  fill_in 'user[password]', with: 'example'
  fill_in 'user[password_confirmation]', with: 'example'
  click_button 'Sign up'
end

def submit_post
  create_community
  visit '/post/new'
  select 's/test_community', from: 'post[community_id]'
  fill_in 'post[message]', with: 'Here is a message'
  click_button 'Submit'
end

def create_community
  visit '/communities/new'
  fill_in 'community[name]', with: 'test_community'
  click_button 'Submit'
end
