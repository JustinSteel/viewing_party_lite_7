require "rails_helper"

RSpec.describe MovieFacade do
  context "class methods" do
    before :each do
      @movie = MovieFacade.new
    end
    context "#movies", :vcr do

      it "exists" do
        expect(@movie).to be_a(MovieFacade)
      end

      it "can create poros of movies and returns an array of movies" do
        expect(MovieFacade.top_rated_movies).to be_a(Array)
        expect(MovieFacade.search_by_title("Lord of the Rings")).to be_a(Array)
        expect(MovieFacade.movie_details(550)).to be_a(Movies)
        expect(MovieFacade.movie_details(550)).to respond_to(:cast)
        expect(MovieFacade.movie_details(550)).to respond_to(:reviews)
      end
    end
  end
end