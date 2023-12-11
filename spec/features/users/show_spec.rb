require "rails_helper"

RSpec.describe "Users show Page", type: :feature do
  before :each do
    @user = User.create(name: "Bob", email: "bob@gmail.com", password: "Yolo911", password_confirmation: "Yolo911")
    @user2 = User.create(name: "Sally", email: "sally@gmail.com", password: "Yolo912", password_confirmation: "Yolo912")
    @user3 = User.create(name: "Joe", email: "joe@gmail.com", password: "Yolo913", password_confirmation: "Yolo913")
  end
  it "should have content" do
    visit "/users/#{@user.id}"

    expect(page).to have_content("Bob's Dashboard")
    expect(page).to have_button("Discover Movies")
  end

  it "should direct to discover page" do
    visit "/users/#{@user.id}"

    click_button "Discover Movies"

    expect(current_path).to eq("/users/#{@user.id}/discover")
  end

  it "should have viewing parties", :vcr do
    visit "/users/#{@user.id}/movies/550/view_parties/new"

    fill_in "Duration of Party", with: 139
    fill_in "Date of Party", with: "01-01-2021"
    fill_in "Start Time", with: "12:00 PM"
    check("guests_#{@user2.id}")
    click_button "Create Party"
    expect(current_path).to eq("/users/#{@user.id}")

    expect(page).to have_content("Fight Club")
    expect(page).to have_content("2021-01-01")
    expect(page).to have_content("12:00 PM")
    expect(page).to have_content("Host: Bob")
    expect(page).to have_content(@user2.name)
    expect(page).to have_content(@user.name)
  end

  it "should have invite parties", :vcr do
    visit "/users/#{@user2.id}/movies/299054/view_parties/new"

    fill_in "Duration of Party", with: 139
    fill_in "Date of Party", with: "02-02-2022"
    fill_in "Start Time", with: "12:21 PM"
    check("guests_#{@user.id}")
    check("guests_#{@user3.id}")
    click_button "Create Party"
    expect(current_path).to eq("/users/#{@user2.id}")

    expect(page).to have_content("Expend4bles")
    expect(page).to have_content("2022-02-02")
    expect(page).to have_content("12:21 PM")
    expect(page).to have_content("Host: Sally")
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user3.name)

    visit "/users/#{@user.id}"

    expect(page).to have_content("Expend4bles")
    expect(page).to have_content("2022-02-02")
    expect(page).to have_content("12:21 PM")
    expect(page).to have_content("Host: Sally")
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user3.name)
  end

  it "should have a link for the title", :vcr do
    visit "/users/#{@user2.id}/movies/299054/view_parties/new"

    fill_in "Duration of Party", with: 139
    fill_in "Date of Party", with: "02-02-2022"
    fill_in "Start Time", with: "12:21 PM"
    check("guests_#{@user.id}")
    check("guests_#{@user3.id}")
    click_button "Create Party"
    expect(current_path).to eq("/users/#{@user2.id}")

    expect(page).to have_link("Expend4bles")

    click_link("Expend4bles")

    expect(current_path).to eq("/users/#{@user2.id}/movies/299054")
  end
end
