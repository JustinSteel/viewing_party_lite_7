require "rails_helper"

RSpec.describe "Users Movie Page", type: :feature do
  describe "As a registered user" do
    it "top rated movies", :vcr do
      user = User.create(name: "Bob", email: "bob@gmail.com")
      visit "/users/#{user.id}/movies"
      expect(page).to have_link("The Godfather")
      click_link("The Godfather")
      expect(current_path).to eq("/users/#{user.id}/movies/238")

      expect(page).to have_content("The Godfather")
      expect(page).to have_content("Vote: 8.71")
      expect(page).to have_content("Runtime: 2h 55min")
      expect(page).to have_content("Genre(s): Drama, Crime")
      expect(page).to have_content("Summary: Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family.")
      expect(page).to have_content("Cast:")
      within("#cast") do
        expect(page).to have_content("Marlon Brando")
        expect(page).to have_content("Al Pacino")
        expect(page).to have_content("James Caan")
        expect(page).to have_content("Richard S. Castellano")
        expect(page).to have_content("Robert Duvall")
        expect(page).to have_content("Sterling Hayden")
        expect(page).to have_content("John Marley")
        expect(page).to have_content("Talia Shire")
        expect(page).to have_content("Gianni Russo")
        expect(page).to have_content("Diane Keaton")
      end
      expect(page).to have_content("5 Reviews:")
      within("#reviews") do
        expect(page).to have_content("Author: futuretv")
        expect(page).to have_content("Author: crastana")
        expect(page).to have_content("Author: drystyx")
        expect(page).to have_content("Author: CinemaSerf")
        expect(page).to have_content("Author: Suresh Chidurala")
        expect(page).to have_content("Review: Great Movie **Ever**")
      end
    end
  end
end
