class UsersController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:id])
    @view_parties = @user.view_parties
  end

  def create
    user = user_params
    user[:name] = user[:name].downcase
    new_user = User.create(user)
    flash[:success] = "Welcome, #{new_user.name}!"
    redirect_to user_path(new_user)
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
