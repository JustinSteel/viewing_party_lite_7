require "rails_helper"

RSpec.describe "Authorization", type: :feature do
  before(:each) do
    @Mario = User.create!(name: "Mario", email: "Mario@gmail.com", password: "Mushroom123", password_confirmation: "Mushroom123", id: 5)
    @Luigi = User.create!(name: "Luigi", email: "Luigi@gmail.com", password: "Mushroom456", password_confirmation: "Mushroom456", id: 7)
  end

  it "page should not have content" do
    visit root_path

    expect(page).to_not have_content("Existing Users")
  end

  it "user should see email addresses" do
    visit root_path

    click_link "Login"

    fill_in "Email:", with: "Luigi@gmail.com"
    fill_in "Password:", with: "Mushroom456"
    click_button "Login"

    expect(current_path).to eq(user_path(@Luigi))

    click_link("Home")
    expect(current_path).to eq(root_path)

    expect(page).to have_content("Existing Users")
    expect(page).to have_content("Mario@gmail.com")
    expect(page).to_not have_link("Mario@gmail.com")
  end

  it "user must be logged in to see dashboard" do
    visit "/users/7"
    expect(page).to have_content("You must be registered and logged in to view this page.")
  end

  it "user must be logged in to create a movie party", :vcr do
    visit "/users/#{@Luigi.id}/movies/238"
    click_button "Create Viewing Party for The Godfather"

    expect(page).to have_content("You must be registered and logged in to create a movie party.")
  end
end
