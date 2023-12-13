class User < ApplicationRecord
  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates_presence_of :password, confirmation: true
  validates :password_confirmation, presence: true

  has_secure_password
  enum role: ["default", "manager", "admin"]

  has_many :user_parties
  has_many :view_parties, through: :user_parties
end
