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
      redirect_to "/register"
    end
  end

  def login_form
  end

  def login_user
    user = User.find_by(email: params[:email])
    user[:email] = user[:email].downcase if user

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to user_path(user)
    else
      flash[:error] = user ? "Sorry, your password is incorrect." : "Sorry, your email was not found."
      render :login_form
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
