require "rails_helper"

RSpec.describe "Register Page", type: :feature do
  it "should have content" do
    visit "/register"
    expect(current_path).to eq("/register")

    expect(page).to have_link("Home")
    expect(page).to have_content("Viewing Party")

    expect(page).to have_content("Name:")
    expect(page).to have_content("Email:")
    expect(page).to have_content("Password:")
    expect(page).to have_content("Password Confirmation:")
    expect(page).to have_button("Create New User")
  end

  it "click button and go to user show page" do
    visit "/register"

    expect(page).to have_content("Name:")
    expect(page).to have_content("Email:")
    expect(page).to have_content("Password:")
    expect(page).to have_content("Password Confirmation:")
    expect(page).to have_button("Create New User")

    fill_in "Name:", with: "Link"
    fill_in "Email:", with: "Link@gmail.com"
    fill_in "Password:", with: "password"
    fill_in "Password Confirmation:", with: "password"

    click_button("Create New User")
  end
end
