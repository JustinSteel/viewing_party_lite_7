class MoviesController < ApplicationController
  def index
    @movies = if params[:title].nil?
      MovieFacade.top_rated_movies
    else
      MovieFacade.search_by_title(params[:title])
    end
  end
end
