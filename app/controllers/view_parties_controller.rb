class ViewPartiesController < ApplicationController

  def new
    @movie = MovieFacade.movie_details(params[:movie_id])
    @users = User.all
    @host = User.find(params[:user_id])  
  end

  def create
    @host = User.find(params[:user_id])
    @movie = MovieFacade.movie_details(params[:movie_id])
    @users = User.all
    @view_party = ViewParty.new(party_params)
    
    if @movie.runtime > @view_party.duration || @view_party.duration <= 0
      flash[:error] = "A viewing party cannot be shorter than the movie's runtime."
      render :new and return
    else
       if @view_party.save
      flash[:success] = "Viewing party created!"
      @user_party = UserParty.create!( user: @host, view_party: @view_party, status: 0 )
      @users.each do |user|
        if user.id != @host.id
          UserParty.create!( user: user, view_party: @view_party, status: 1 )
        end
        end
      end
    end
      redirect_to user_path(@host)
  end

  private
  
  def party_params
    params.permit(:movie_title, :image, :duration, :date, :start_time, :movie_id)
  end
end