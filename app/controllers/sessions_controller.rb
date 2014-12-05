class SessionsController < ApplicationController

  def new
    @current_user
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user.authenticate(params[:password])
      redirect_to root_path, notice: "You're signed in, #{@user.username}. Woohoo!"
    end
  end

end
