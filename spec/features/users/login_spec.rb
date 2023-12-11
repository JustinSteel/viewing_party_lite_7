require "rails_helper"

RSpec.describe "Log in", type: :feature do
  before(:each) do
    @toon_link = User.create!(name: "Toon Link", email: "ToonLink@gmail.com", password: "Hyrule123", password_confirmation: "Hyrule123")
    visit root_path
  end

  it "should go to the log in page" do
    expect(page).to have_link("Log In")
    click_link "Log In"

    expect(current_path).to eq("/login")
  end

  it "should log in" do
    visit "/login"

    expect(page).to have_content("Email:")
    expect(page).to have_content("Password:")
    expect(page).to have_button("Log In")

    fill_in "Email:", with: "ToonLink@gmail.com"
    fill_in "Password:", with: "Hyrule123"

    click_button "Log In"

    expect(page).to have_content("Welcome, #{@toon_link.name}")
  end

  it "should not find email/log in" do
    visit "/login"

    fill_in "Email:", with: "JK@gmail.com"
    fill_in "Password:", with: "Hyrule123"

    click_button "Log In"

    expect(page).to have_content("Sorry, your email was not found.")
  end

  it "should not find log in/ bad password" do
    visit "/login"

    fill_in "Email:", with: "ToonLink@gmail.com"
    fill_in "Password:", with: "Hyrule777"

    click_button "Log In"

    expect(page).to have_content("Sorry, your password is incorrect.")
  end
end
