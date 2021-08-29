def create_user
  User.create(id: 1,
              username: 'username',
              email: 'test@test.com',
              password: "password",
              password_confirmation: "password")
end
