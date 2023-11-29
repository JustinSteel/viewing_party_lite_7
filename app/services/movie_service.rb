class MovieService
  def members_by_state(state)
    get_url("/congress/v1/members/house/#{state}/current.json")
  end

  def search_by_title(title)
    get_url("/3/search/movie?query=#{title}&include_adult=false&language=en-US&page=1")
  end

  def top_rated_movies
    get_url("/3/movie/top_rated?language=en-US&page=1")
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