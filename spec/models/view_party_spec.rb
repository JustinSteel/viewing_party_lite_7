require "rails_helper"

RSpec.describe ViewParty, type: :model do
  describe "validations" do
    it { should validate_presence_of(:movie_title) }
    it { should validate_presence_of(:movie_id) }
    it { should validate_presence_of(:image) }
    it { should validate_presence_of(:duration) }
    it { should validate_presence_of(:day) }
    it { should validate_presence_of(:start_time) }
  end

  describe "relationships" do
    it { should have_many(:user_parties) }
    it { should have_many(:users).through(:user_parties) }
  end
end
