require "rails_helper"

RSpec.describe "Login Page", type: :feature do
  it "can login" do
    user = User.create(name: "Randy", email: "randy@gmail.com", id: 782, password: "password", password_confirmation: "password")
    visit root_path

    expect(page).to have_content("Login")

    click_link("Login")
    expect(current_path).to eq(login_path)

    expect(page).to have_content("Email:")
    expect(page).to have_content("Password:")

    fill_in "Email:", with: "randy@gmail.com"
    fill_in "Password:", with: "password"

    click_button("Login")
    expect(current_path).to eq(user_path(user))
  end

  it "cant login with bad credentials" do
    user = User.create(name: "Randy", email: "randy@gmail.com", id: 782, password: "password", password_confirmation: "password")

    visit root_path

    expect(page).to have_content("Login")

    click_link("Login")
    expect(current_path).to eq(login_path)

    expect(page).to have_content("Email:")
    expect(page).to have_content("Password:")

    fill_in "Email:", with: "randy@gmail.com"
    fill_in "Password:", with: "pass"

    click_button("Login")
    expect(current_path).to eq(login_path)
    expect(page).to have_content("Sorry, your credentials are bad.")
  end
end