class UserParty < ApplicationRecord
  validates :status, presence: true

  enum :status, ["host", "invited"]

  belongs_to :user
  belongs_to :view_party
end
