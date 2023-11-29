require "rails_helper"

RSpec.describe "Users discover Page", type: :feature do
  it "should have content" do
    user = User.create(name: "Bob", email: "bob@gmail.com", id: 782)
    visit "/users/#{user.id}/discover"

    expect(page).to have_content("Discover Movies")
    expect(page).to have_button("Find Top Rated Movies")
    expect(page).to have_field(:title)
    expect(page).to have_button("Search")
  end
end
