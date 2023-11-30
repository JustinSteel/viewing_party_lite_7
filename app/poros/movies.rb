class Movies
  attr_reader :title,
    :vote_average,
    :id,
    :overview,
    :poster_path,
    :cast,
    :reviews,
    :genres,
    :runtime

  def initialize(movie_data, cast_data = [], review_data = [])
    @cast = cast_data.map { |cast_member| [cast_member[:name], cast_member[:character]] }
    @id = movie_data[:id]
    @reviews = review_data.map { |review| [review[:author], review[:content]] }
    @title = movie_data[:title]
    @genres = movie_data[:genres].map { |genre| genre[:name] }.join(', ')
    @runtime = movie_data[:runtime]
    @overview = movie_data[:overview]
    @poster_path = movie_data[:poster_path]
    @vote_average = movie_data[:vote_average]
  end

  def review_count
    @reviews.count
  end
end
