class ViewPartiesController < ApplicationController

  def new
    @movie = MovieFacade.movie_details(params[:movie_id])
    @users = User.all
    @host = User.find(params[:user_id])
  end

  private
  
  def party_params
    params.permit(:movie_title, :image, :duration, :date, :start_time, :movie_id, :user_id)
  end
end