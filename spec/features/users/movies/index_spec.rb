require "rails_helper"

RSpec.describe "Users Movie Page", type: :feature do
  describe "As a registered user" do
    it "should have content", :vcr do
      user = User.create(name: "Bob", email: "bob@gmail.com")
      visit "/users/#{user.id}/discover"

      click_button("Find Top Rated Movies")
      expect(current_path).to eq("/users/#{user.id}/movies")

      expect(page).to have_link("The Shawshank Redemption")
      expect(page).to have_content("Vote Average: 8.7")
      expect(page).to have_button("Discover Page")
    end

    it "should show title based on search", :vcr do
      user = User.create(name: "Bob", email: "bob@gmail.com")
      visit "/users/#{user.id}/discover"

      fill_in :title, with: "Lord of the Rings"
      click_button("Search")
      expect(current_path).to eq("/users/#{user.id}/movies")

      expect(page).to have_link("The Lord of the Rings: The Fellowship of the Ring")
    end
  end
end
