# spec/features/auth_spec.rb

require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "New User"
  end

  feature "signing up a user" do

    scenario "shows username on the homepage after signup" do
      visit new_user_url
      fill_in 'username', :with => "Test Username"
      fill_in 'password', :with => "testpass"
      click_on "Create User"
      expect(page).to have_content "Test Username"
    end

  end

  feature "logging in" do

    scenario "shows username on the homepage after login" do
      visit new_user_url
      fill_in 'username', :with => "Test Username"
      fill_in 'password', :with => "testpass"
      click_on "Create User"
      click_on "Log Out"
      visit new_session_url
      fill_in 'username', :with => "Test Username"
      fill_in 'password', :with => "testpass"
      click_on "Sign In"
      expect(page).to have_content "Test Username"
    end
  end

  feature "logging out" do

    scenario "begins with logged out state" do
      visit new_session_url
      expect(page).to have_content "Log In"
      expect(page).to_not have_content "Log Out"
    end

    scenario "doesn't show username on the homepage after logout" do
      visit new_user_url
      fill_in 'username', :with => "Test Username"
      fill_in 'password', :with => "testpass"
      click_on "Create User"
      click_on "Log Out"
      expect(page).to_not have_content "Test Username"
    end

  end

end
