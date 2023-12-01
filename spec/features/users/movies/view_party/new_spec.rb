require "rails_helper"

RSpec.describe "View Party New Page", type: :feature do
  before :each do
    @user = User.create(name: "Bob", email: "bob@gmail.com")
  end
  describe "create a new view party" do
    it "should have content", :vcr do
      visit "/users/#{@user.id}/"
    end
  end
end
