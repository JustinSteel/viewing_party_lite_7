class Movies
  attr_reader :title
              :vote_average
              :id
              :overview
              :poster_path

  def initialize(movie_data)
    @id           = movie_data[:id]
    @title        = movie_data[:title]
    @overview     = movie_data[:overview]
    @poster_path  = movie_data[:poster_path]
    @vote_average = movie_data[:vote_average]
  end
end