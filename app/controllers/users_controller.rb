class UsersController < ApplicationController
  # attr_accessor :password

  def index
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end

  private

  def user_params
    (params.require(:user).permit(:username, :password))
  end
end
