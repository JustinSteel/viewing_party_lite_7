require "rails_helper"

RSpec.describe "Users show Page", type: :feature do
  before :each do
    @user = User.create(name: "Bob", email: "bob@gmail.com")
  end
  it "should have content" do
    visit "/users/#{@user.id}"

    expect(page).to have_content("Bob's Dashboard")
    expect(page).to have_button("Discover Movies")
    expect(page).to have_content("API STUFF")
  end

  it "should direct to discover page" do
    visit "/users/#{@user.id}"

    click_button "Discover Movies"

    expect(current_path).to eq("/users/#{@user.id}/discover")
  end
end
