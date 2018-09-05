require 'rails_helper'

describe 'user can login to existing account' do
  describe "user visits '/'" do
    it 'logs in with existing credentials' do
      user = User.create(username: 'test123', password: 'test124')

      visit '/'

      click_on "Sign In"

      expect(current_path).to eq(login_path)
      fill_in "username", with: user.username
      fill_in "password", with: user.password

      click_on "Log In"

      expect(current_path).to eq(user_path(user))

      expect(page).to have_content("Welcome, #{user.username}")
      expect(page).to have_content("Log Out")
    end
  end
end
