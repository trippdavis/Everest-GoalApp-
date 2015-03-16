
require 'spec_helper'
require 'rails_helper'


feature "Users have goals" do
  before(:each) do
    visit new_user_url
    fill_in 'username', :with => "Test Username"
    fill_in 'password', :with => "testpass"
    click_on "Create User"
  end


  feature "User creates new goal" do

    scenario "There is a page to create a new goal" do
      visit new_goal_url
      expect(page).to have_content("What's your goal?")
    end

    scenario "Successful creation redirects to goal page" do
      visit new_goal_url
      fill_in :description, :with => "example goal"
      choose(:public)
      choose(:incomplete)
      click_on "Create Goal"
      expect(page).to have_content("example goal")
      expect(page).to have_content("incomplete")
      expect(page).to have_content("public")
    end
  end

  feature "User updates existing goal" do
    before(:each) do
      visit new_goal_url
      fill_in :description, :with => "example goal"
      choose(:public)
      choose(:incomplete)
      click_on "Create Goal"
    end

    scenario "There is a link to edit a goal on the show page" do
      expect(page).to have_content("Update")
      click_on("Update")
      expect(page).to have_content("Update Goal")
    end

    scenario "Successful update of goal redirects to show page" do
      click_on "Update"
      fill_in :description, :with => "to eat all of the jelly beans!"
      choose(:complete)
      click_on("Update")
      expect(page).to have_content("to eat all of the jelly beans!")
      expect(page).to have_content("complete")
      expect(page).to have_content("public")
    end

    scenario "Unsuccessful update of goal renders new edit page" do
      click_on "Update"
      fill_in :description, :with => ""
      click_on("Update")
      expect(page).to have_content("Update Goal")
      expect(page).to have_content("Description can't be blank")
    end
  end

  feature "User deletes existing goal" do
    before(:each) do
      visit new_goal_url
      fill_in :description, :with => "example goal"
      choose(:public)
      choose(:incomplete)
      click_on "Create Goal"
    end

    scenario "There is a link to delete a goal on the show page" do
      expect(page).to have_content("Delete")
    end

    scenario "Deleting a goal redirect to user's page" do
      click_on("Delete")
      expect(page).to have_content("Test Username")
    end

    scenario "Deletes goal from user's page" do
      click_on("Delete")
      expect(page).to_not have_content("example goal")
    end
  end

  feature "Proper goals are displayed" do
    before(:each) do
      visit new_goal_url
      fill_in :description, :with => "example goal"
      choose(:public)
      choose(:incomplete)
      click_on "Create Goal"
      visit new_goal_url
      fill_in :description, :with => "private goal"
      choose(:private)
      choose(:incomplete)
      click_on "Create Goal"
    end

    scenario "User can see own public and private goals" do
      click_on("all_goals")
      expect(page).to have_content("example goal")
      expect(page).to have_content("private goal")
    end

    scenario "Other user can only see public goals" do
      click_on("Log Out")
      visit new_user_url
      fill_in 'username', :with => "User2"
      fill_in 'password', :with => "testpass"
      click_on "Create User"
      visit goals_url
      expect(page).to have_content("example goal")
      expect(page).to_not have_content("private goal")
    end
  end
end
