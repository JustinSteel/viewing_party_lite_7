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
    if new_user.save
    flash[:success] = "Welcome, #{new_user.name}!"
    redirect_to user_path(new_user)
    else
      flash[:error] = new_user.errors.full_messages.to_sentence
      redirect_to register_path
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
