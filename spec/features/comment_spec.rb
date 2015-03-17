require 'spec_helper'
require 'rails_helper'

feature "Comments" do
  let(:user1) { FactoryGirl.create(:user, username: 'David', session_token: "1") }
  let(:user2) { FactoryGirl.create(:user, username: 'Jeff', session_token: "2") }
  let(:goal) { FactoryGirl.create(:goal, user: user1) }

  before(:each) do
    login(user2)
  end

  feature "User can create comments" do
    scenario "On a user" do
      visit user_url(user1)
      expect(page).to have_content("Add Comment")
    end

    scenario "On a goal" do
      visit goal_url(goal)
      expect(page).to have_content("Add Comment")
    end

    scenario "Successful creation of user comment redirects to user show page" do
      visit user_url(user1)
      fill_in "body", :with => "Gooooo! David"
      click_on "Add Comment"
      expect(page).to have_content("Gooooo! David")
      expect(page).to have_content(user1.username)
    end

    scenario "Successful creation of goal comment redirects to goal show page" do
      visit goal_url(goal)
      fill_in "body", :with => "Gooooo! David"
      click_on "Add Comment"
      expect(page).to have_content("Gooooo! David")
      expect(page).to have_content(goal.description)
    end
  end


end

def login(user)
  visit new_session_url
  fill_in 'username', :with => user.username
  fill_in 'password', :with => 'password1'
  click_on "Sign In"
end
