require "rails_helper"

RSpec.describe "login", type: :feature do
  before(:each) do
    @toon_link = User.create!(name: "Toon Link", email: "ToonLink@gmail.com", password: "Hyrule123", password_confirmation: "Hyrule123")
    visit root_path
  end

  it "should go to the login page" do
    expect(page).to have_link("Login")
    click_link "Login"

    expect(current_path).to eq("/login")
  end

  it "should login" do
    visit "/login"

    expect(page).to have_content("Email:")
    expect(page).to have_content("Password:")
    expect(page).to have_button("Login")

    fill_in "Email:", with: "ToonLink@gmail.com"
    fill_in "Password:", with: "Hyrule123"

    click_button "Login"

    expect(page).to have_content("Welcome, #{@toon_link.name}")
  end

  it "should not find email/login" do
    visit "/login"

    fill_in "Email:", with: "JK@gmail.com"
    fill_in "Password:", with: "Hyrule123"

    click_button "Login"

    expect(page).to have_content("Sorry, your credentials are bad.")
  end

  it "should not find login/ bad password" do
    visit "/login"

    fill_in "Email:", with: "ToonLink@gmail.com"
    fill_in "Password:", with: "Hyrule777"

    click_button "Login"

    expect(page).to have_content("Sorry, your credentials are bad.")
  end
end
