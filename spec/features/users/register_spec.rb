require "rails_helper"

RSpec.describe "Register Page", type: :feature do
  it "should have content" do
    visit "/register"
    expect(current_path).to eq("/register")

    expect(page).to have_link("Home")
    expect(page).to have_content("Viewing Party")

    expect(page).to have_content("Name:")
    expect(page).to have_content("Email:")
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
    fill_in "Password:", with: "Yolo911"
    fill_in "Password Confirmation:", with: "Yolo911"

    click_button("Create New User")
  end

  it "cant create a user with bad name credentials" do
    visit "/register"

    fill_in "Name:", with: ""
    fill_in "Email:", with: "Link@gmail.com"
    fill_in "Password:", with: "Yolo911"
    fill_in "Password Confirmation:", with: "Yolo911"

    click_button("Create New User")
    expect(current_path).to eq("/register")
    expect(page).to have_content("Name can't be blank")
  end

  it "cant create a user with bad email credentials" do
    visit "/register"

    fill_in "Name:", with: "Link"
    fill_in "Email:", with: ""
    fill_in "Password:", with: "Yolo911"
    fill_in "Password Confirmation:", with: "Yolo911"

    click_button("Create New User")
    expect(current_path).to eq("/register")
    expect(page).to have_content("Email can't be blank")
  end

  it "cant create a user with bad password credentials" do
    visit "/register"

    fill_in "Name:", with: "Link"
    fill_in "Email:", with: "Link@gmail.com"
    fill_in "Password:", with: ""
    fill_in "Password Confirmation:", with: "2"

    click_button("Create New User")
    expect(current_path).to eq("/register")
    expect(page).to have_content("Password can't be blank")
  end

  it "cant create a user with bad password confirmation credentials" do
    visit "/register"

    fill_in "Name:", with: "Link"
    fill_in "Email:", with: "Link@gmail.com"
    fill_in "Password:", with: "Yolo911"
    fill_in "Password Confirmation:", with: ""

    click_button("Create New User")
    expect(current_path).to eq("/register")
    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end
