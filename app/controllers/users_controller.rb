class UsersController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    if current_user?
    @user = User.find(params[:id])
    @view_parties = @user.view_parties
    else
      flash[:error] = "You must be logged in to view this page."
      redirect_to login_path
    end
  end

  def login_form

  end

  def login_user
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to user_path(user)
    else
      flash[:error] = "Sorry, your credentials are bad."
      redirect_to login_path
    end
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

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
