require 'rails_helper'

describe 'new user can create a login' do
  describe 'registration' do
    it "allows user to sign up" do
      username = 'test123'

      visit '/'

      click_on "Sign Up"

      expect(current_path).to eq(new_user_path)

      fill_in :user_username, with: username
      fill_in :user_password, with: "test"

      click_on "Create User"

      expect(page).to have_content("Welcome, #{username}")
    end

    it 'blocks registration when username is not unique' do
      User.create(username: 'username1', password: 'whatever')
      username = 'username1'

      visit '/'

      click_on 'Sign Up'

      expect(current_path).to eq (new_user_path)

      fill_in :user_username, with: username
      fill_in :user_password, with: 'password'

      click_on 'Create User'

      expect(page).to_not have_content("Welcome, #{username}")
    end
  end

  describe 'login' do
    it "allows users to login successfully" do
      user = User.create(username: "greg", password: "greggreggreg")
      visit root_path

      click_on 'Sign In'

      expect(current_path).to eq(login_path)

      fill_in :username, with: user.username
      fill_in :password, with: user.password

      click_on 'Log In'

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Welcome, #{user.username}")
    end

    it "blocks users from logging in unsuccessfully" do
      user = User.create(username: "greg", password: "greggreggreg")
      visit root_path

      click_on 'Sign In'

      expect(current_path).to eq(login_path)

      fill_in :username, with: user.username
      fill_in :password, with: 'bad password'

      click_on 'Log In'

      expect(current_path).to eq(login_path)
      expect(page).to_not have_content("Welcome, #{user.username}")
    end
  end

  describe 'logout' do
    it 'allows a user to log out successfully' do
      user = User.create(username: "greg", password: "greggreggreg")
      visit login_path

      fill_in :username, with: user.username
      fill_in :password, with: user.password

      click_on 'Log In'
      expect(page).to have_content("Welcome, greg")

      click_on 'Log Out'

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Sign Up")
    end
  end
end
