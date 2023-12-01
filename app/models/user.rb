class User < ApplicationRecord
  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}

  has_many :user_parties
  has_many :view_parties, through: :user_parties
end
