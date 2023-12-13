class ViewPartiesController < ApplicationController
  def new
    if current_user?
      @movie = MovieFacade.movie_details(params[:movie_id])
      @users = User.all
      @host = User.find(params[:user_id])
      @view_party = ViewParty.new
    else
      flash[:error] = "You must be registered and logged in to create a movie party."
      redirect_to user_movie_path(params[:user_id], params[:movie_id])
    end
  end

  def create
    @host = User.find(params[:user_id])
    @movie = MovieFacade.movie_details(params[:movie_id])
    @users = params[:guests].map do |guest|
      User.find(guest)
    end
    @view_party = ViewParty.new(
      movie_title: @movie.title,
      image: @movie.poster_path,
      day: params[:day],
      start_time: params[:start_time],
      duration: params[:duration],
      movie_id: params[:movie_id]
    )

    if @movie.runtime > @view_party.duration || @view_party.duration <= 0
      flash[:error] = "A viewing party cannot be shorter than the movie's runtime."
      redirect_to new_user_movie_view_party_path(@host, @movie.id)
    elsif @view_party.save
      flash[:success] = "Viewing party created!"
      @user_party = UserParty.create!(user: @host, view_party: @view_party, status: 0)
      @users.each do |user|
        UserParty.create!(user: user, view_party: @view_party, status: 1)
      end
      redirect_to user_path(@host)
    end
  end
end
