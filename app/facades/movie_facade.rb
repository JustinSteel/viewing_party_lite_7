class MovieFacade
  def self.top_rated_movies
    MovieService.new.top_rated_movies[:results]
  end

  def self.search_by_title(title)
    MovieService.new.search_by_title(title)[:results]
  end

  def self.movie_details(id)
    movie = MovieService.new.movie_details(id)
    cast = MovieService.new.movie_cast(id)[:cast].first(10)
    reviews = MovieService.new.movie_reviews(id)[:results]
    Movie.new(movie, cast, reviews)
  end
end
