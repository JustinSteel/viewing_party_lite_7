require "rails_helper"

RSpec.describe "poros" do
  context "movies" do
    it "exists" do
      attrs = {
        title: "The Shawshank Redemption",
        id: 1,
        cast: [],
        reviews: [],
        genres: [],
        runtime: 1,
        overview: "Lorem ipsum",
        poster_path: "path",
        vote_average: 1
      }
  
      movie = Movies.new(attrs)
  
      expect(movie).to be_a Movies
      expect(movie.title).to be_a(String)
      expect(movie.id).to be_a(Integer)
      expect(movie.cast).to be_a(Array)
      expect(movie.reviews).to be_a(Array)
      expect(movie.genres).to be_a(Array)
      expect(movie.runtime).to be_a(Integer)
      expect(movie.overview).to be_a(String)
      expect(movie.poster_path).to be_a(String)
      expect(movie.vote_average).to be_a(Integer)
    end 
  end
end