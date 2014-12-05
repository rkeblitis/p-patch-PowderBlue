class SessionsController < ApplicationController

  def new
    @current_user
  end

  def create
    @current_user = User.find_by(username: params[:username])
    if @current_user.authenticate(params[:password])
      redirect_to root_path, notice: "You're signed in, #{@current_user.username}. Woohoo!"
    end
  end

  def create_oauth
    auth_hash = request.env['omniauth.auth']
    raise
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Signed Out"
  end
end
