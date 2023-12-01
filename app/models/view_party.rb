class ViewParty < ApplicationRecord
  validates :movie_title, presence: true
  validates :movie_id, presence: true
  validates :image, presence: true
  validates :day, presence: true
  validates :duration, presence: true
  validates :start_time, presence: true

  has_many :user_parties
  has_many :users, through: :user_parties

  def host
    user_parties.where(status: 0).first.user.name
  end

  def start_time_formatted
    start_time.strftime("%I:%M %p")
  end

  def guests
    user_parties.where(status: 1).map do |user_party|
      user_party.user.name
    end
  end

  def picture
    url = MovieFacade.image
    "#{url[:base_url]}#{url[:poster_sizes][3]}#{image}"
  end
end
