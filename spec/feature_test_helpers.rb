# frozen_string_literal: true

def sign_up
  visit '/user/sign_up'
  fill_in 'user[username]', with: 'example'
  fill_in 'user[email]', with: 'example@example.com'
  fill_in 'user[password]', with: 'example'
  fill_in 'user[password_confirmation]', with: 'example'
  click_button 'Sign up'
end

def sign_up_second_user
  visit '/user/sign_up'
  fill_in 'user[username]', with: 'second_example'
  fill_in 'user[email]', with: 'second@example.com'
  fill_in 'user[password]', with: 'second'
  fill_in 'user[password_confirmation]', with: 'second'
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

def create_second_community
  visit '/communities/new'
  fill_in 'community[name]', with: 'second_test_community'
  click_button 'Submit'
end

def submit_post_to_second_community
  create_second_community
  visit '/post/new'
  select 's/second_test_community', from: 'post[community_id]'
  fill_in 'post[message]', with: 'Here is a message to the second community'
  click_button 'Submit'
end
