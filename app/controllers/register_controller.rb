class RegisterController < ApplicationController
  def index
    @users = User.all
  end
end
