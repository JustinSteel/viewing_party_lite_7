class MovieService
  def search_by_title(title)
    get_url("/3/search/movie?query=#{title}&include_adult=false&language=en-US&page=1")
  end

  def top_rated_movies
    get_url("/3/movie/top_rated?language=en-US&page=1")
  end

  def movie_details(id)
    get_url("/3/movie/#{id}?language=en-US")
  end

  def movie_cast(id)
    get_url("/3/movie/#{id}/credits?language=en-US")
  end

  def movie_reviews(id)
    get_url("/3/movie/#{id}/reviews?language=en-US&page=1")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.params["api_key"] = Rails.application.credentials.themoviedb[:key]
    end
  end
end
