require "rails_helper"

RSpec.describe "Users show Page", type: :feature do
  before :each do
    @user = User.create(name: "Bob", email: "bob@gmail.com")
    @user2 = User.create(name: "Sally", email: "sally@gmail.com")
    @user3 = User.create(name: "Joe", email: "joe@gmail.com")
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
      fill_in "Date of Party", with: '01-01-2021'
      fill_in "Start Time", with: '12:00 PM'
      check("guests_#{@user2.id}")
      click_button "Create Party"
      expect(current_path).to eq("/users/#{@user.id}")
      save_and_open_page
      expect(page).to have_content("Fight Club")
      expect(page).to have_content("2021-01-01")
      expect(page).to have_content("12:00 PM")
      expect(page).to have_content("Host: Bob")
      expect(page).to have_content(@user2.name)
      expect(page).to have_content(@user.name)
  end
end
