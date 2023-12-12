require "rails_helper"

RSpec.describe "Logout Page", type: :feature do
  it "can logout" do
    user = User.create(name: "Randy", email: "randy@gmail.com", password: "password", password_confirmation: "password")
    visit login_path

    fill_in "Email:", with: "randy@gmail.com"
    fill_in "Password:", with: "password"

    click_button("Login")
    expect(current_path).to eq(user_path(user))

    click_link("Home")
    expect(current_path).to eq(root_path)
    
    click_link("Logout")
    expect(current_path).to eq(root_path)
  end
end