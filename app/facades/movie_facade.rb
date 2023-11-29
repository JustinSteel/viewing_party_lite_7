class MovieFacade
  def self.top_rated_movies
    MovieService.new.top_rated_movies[:results]
  end

  def self.search_by_title(title)
    MovieService.new.search_by_title(title)[:results]
  end
end
