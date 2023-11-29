require "rails_helper"

describe MovieService do
  context "class methods" do
    context "#top_rated_movies" do
      it "returns top movie data" do
        top_movies = MovieService.new.top_rated_movies

        expect(top_movies).to be_a Hash
        expect(top_movies[:results]).to be_an Array
        movie_data = top_movies[:results].first

        expect(movie_data).to have_key :vote_average
        expect(movie_data[:vote_average]).to be_a(Float)

        expect(movie_data).to have_key :overview
        expect(movie_data[:overview]).to be_a(String)

        expect(movie_data).to have_key :poster_path
        expect(movie_data[:poster_path]).to be_a(String)
      end
    end

    context "#search_by_title" do
      it "returns movies relating to search" do
        search = MovieService.new.search_by_title("The Grinch")

        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array

        movie_data = search[:results].first

        expect(movie_data).to have_key :title
        expect(movie_data[:title]).to be_a(String)

        expect(movie_data).to have_key :vote_average
        expect(movie_data[:vote_average]).to be_a(Float)

        expect(movie_data).to have_key :overview
        expect(movie_data[:overview]).to be_a(String)

        expect(movie_data).to have_key :poster_path
        expect(movie_data[:poster_path]).to be_a(String)
      end
    end
  end
end
