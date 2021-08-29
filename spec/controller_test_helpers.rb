def create_user
  User.create(username: 'username', email: 'test@test.com', password: "password", password_confirmation: "password")
end
