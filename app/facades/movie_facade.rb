class MovieFacade
  def self.top_rated_movies
    m = MovieService.new.top_rated_movies[:results]
    require 'pry'; binding.pry
  end

  def self.search_by_title(title)
    MovieService.new.search_by_title(title)[:results]
  end
end
