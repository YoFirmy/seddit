def sign_up
  visit "/user/sign_up"
  fill_in "user[username]", with: "example"
  fill_in "user[email]", with: "example@example.com"
  fill_in "user[password]", with: "example"
  fill_in "user[password_confirmation]", with: "example"
  click_button "Sign up"
end
