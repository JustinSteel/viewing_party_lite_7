require "rails_helper"

RSpec.describe "Authorization", type: :feature do
  describe "As a visitor" do
    it "should not allow visitor to view existing users" do
      user = User.create(name: "Randy", email: "randy@gmail.com", password: "password", password_confirmation: "password")
      visit root_path

      expect(page).to_not have_link("randy@gmail.com")
    end

    it "existing users should not be links to their show page" do
      user = User.create(name: "Randy", email: "randy@gmail.com", password: "password", password_confirmation: "password")
      user2 = User.create(name: "Mandy", email: "mandy@gmail.com", password: "passwords", password_confirmation: "passwords")
      visit root_path

      click_link("Login")
      fill_in "Email:", with: "randy@gmail.com"
      fill_in "Password:", with: "password"
      click_button("Login")
      expect(current_path).to eq(user_path(user))

      click_link("Home")
      expect(current_path).to eq(root_path)

      expect(page).to_not have_link("mandy@gmail.com")
      expect(page).to have_content("mandy@gmail.com")
    end

    it "should not allow visitor to view dashboard" do
      user = User.create(name: "Randy", email: "randy@gmail.com", password: "password", password_confirmation: "password")
      visit "/users/#{user.id}"
      expect(page).to have_content("You must be logged in to view this page.")
    end

    it "should not allow visitor to create a viewing party", :vcr do
      user = User.create(name: "Randy", email: "randy@gmail.com", password: "password", password_confirmation: "password")
      visit "/users/#{user.id}/movies/550"
      click_button("Create Viewing Party for Fight Club")
      expect(current_path).to eq("/users/#{user.id}/movies/550")
      expect(page).to have_content("You must be logged in to view this page.")
    end
  end
end