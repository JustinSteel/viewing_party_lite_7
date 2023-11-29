class MoviesController < ApplicationController
  def index 
    if params[:title].nil? 
      @movies = MovieFacade.top_rated_movies 
    else
      @movies = MovieFacade.search_by_title(params[:title])
    end
  end
end
