require "rails_helper"

RSpec.describe "Landing Page", type: :feature do
  it "should have content" do
    visit root_path
    expect(current_path).to eq(root_path)

    expect(page).to have_link("Home")
    expect(page).to have_content("Viewing Party")
    expect(page).to have_button("Create New User")
    expect(page).to have_content("Existing Users")
  end

  it "should go to the log in page" do
    visit root_path

    expect(page).to have_link("Log In")
    click_link "Log In"

    expect(current_path).to eq("/login")
  end

  it "should log in" do
    visit "/login"

    expect(page).to have_content("Email:")
    expect(page).to have_content("Password:")
    fill_in "Email:", with: "Sheik@gmail.com"
    fill_in "Password:", with: "Hyrule123"
  end
end
