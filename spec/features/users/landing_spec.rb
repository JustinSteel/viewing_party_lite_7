require "rails_helper"

RSpec.describe "Landing Page", type: :feature do
  it "should have content" do
    visit root_path
    expect(current_path).to eq(root_path)

    expect(page).to have_link("Home")
    expect(page).to have_content("Viewing Party")
    expect(page).to have_button("Create New User")
    expect(page).to have_content("Existing Users")
  end
end