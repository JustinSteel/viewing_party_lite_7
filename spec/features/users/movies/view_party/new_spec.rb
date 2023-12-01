require "rails_helper"

RSpec.describe "View Party New Page", type: :feature do
  before :each do
    @user = User.create(name: "Bob", email: "bob@gmail.com")
    @user2 = User.create(name: "Sally", email: "sally@gmail.com")
    @user3 = User.create(name: "Joe", email: "joe@gmail.com")
  end
  describe "create a new view party" do
    it "should have content", :vcr do
      visit "/users/#{@user.id}/movies/550/view_parties/new"

      expect(page).to have_content("Create a Viewing Party for Fight Club")
      expect(page).to have_button("Discover Page")
      within("#party_details") do
        expect(page).to have_content("Movie Title: Fight Club")
        expect(page).to have_content("Duration of Party")
        expect(page).to have_content("Date of Party")
        expect(page).to have_content("Start Time")
        expect(page).to have_content("Invite Other Users")
        expect(page).to have_content("Sally (sally@gmail.com)")
        expect(page).to have_content("Joe (joe@gmail.com)")
        expect(page).to have_no_content("Bob (bob@gmail.com)")
        expect(page).to have_button("Create Party")
      end
    end

    it "should create a new view party", :vcr do
      visit "/users/#{@user.id}/movies/550/view_parties/new"

      fill_in "Duration of Party", with: 139
      fill_in "Date of Party", with: "2021-01-01"
      fill_in "Start Time", with: "12:00"
      check "Sally (sally@gmail.com)"
      click_button "Create Party"
      expect(current_path).to eq("/users/#{@user.id}")
    end

    it "should not create a new view party", :vcr do
      visit "/users/#{@user.id}/movies/550/view_parties/new"
      expect(current_path).to eq("/users/#{@user.id}/movies/550/view_parties/new")
    end
  end
end
