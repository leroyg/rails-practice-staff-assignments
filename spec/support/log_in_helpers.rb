def log_in_user(user)
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_on "Login"
end