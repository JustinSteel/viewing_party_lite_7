require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should allow_value("user@example.com").for(:email) }
    it { should_not allow_value("user").for(:email) }
    it { should validate_presence_of(:password) }
    it { should have_secure_password }
  end

  describe "relationships" do
    it { should have_many(:user_parties) }
    it { should have_many(:view_parties).through(:user_parties) }
  end
end
