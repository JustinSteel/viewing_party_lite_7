class ViewParty < ApplicationRecord
  validates :movie_title, presence: true
  validates :movie_id, presence: true
  validates :image, presence: true
  validates :day, presence: true
  validates :duration, presence: true
  validates :start_time, presence: true

  has_many :user_parties
  has_many :users, through: :user_parties
end
