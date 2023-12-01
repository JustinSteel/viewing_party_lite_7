require "rails_helper"

RSpec.describe UserParty, type: :model do
  describe "validations" do
    it { should validate_presence_of(:status) }
  end

  describe "relationships" do
    it { should belong_to(:user) }
    it { should belong_to(:view_party) }
  end
end
