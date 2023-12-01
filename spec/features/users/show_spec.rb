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
      fill_in "Date of Party", with: Date.today.strftime('%Y-%m-%d')
      fill_in "Start Time", with: Time.now
      check "Sally (sally@gmail.com)"
      save_and_open_page
      click_button "Create Party"
      expect(current_path).to eq("/users/#{@user.id}")
      # expect(page).to have_content(@movie.poster_path)
      expect(page).to have_content(@view_party.movie.title)
      expect(page).to have_content(@view_party.day)
      expect(page).to have_content(@view_party.start_time)
      expect(page).to have_content(@user2.name)
      expect(page).to have_content(@user_party.status)
      expect(page).to have_content(@user.name)
  end
end
