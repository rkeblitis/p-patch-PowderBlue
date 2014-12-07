class UsersController < ApplicationController
  # attr_accessor :password

  def index
  end

  def new
    @current_user = User.new
  end

  def create
    @current_user = User.new(user_params)
    if @current_user.save
      session[:user_id] = @current_user.id
      redirect_to root_path, notice: "Thank you, #{@current_user.username}"
    else
      render :new
    end
  end

  private

  def user_params
    (params.require(:user).permit(:username, :email, :password, :password_confirmation))
  end
end
