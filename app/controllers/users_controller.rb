class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.create(
      name: params[:name],
      email: params[:email]
    )
    redirect_to "/users/#{@user.id}"
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
