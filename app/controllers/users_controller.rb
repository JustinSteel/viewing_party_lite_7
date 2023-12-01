class UsersController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:id])
    @view_parties = @user.view_parties
    # require 'pry'; binding.pry
  end

  def create
    @user = User.create(user_params)
    redirect_to "/users/#{@user.id}"
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
