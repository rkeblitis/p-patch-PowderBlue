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
    if auth_hash[:uid]
        Oauth.find_by(uid: auth_hash[:uid])
        @current_user
    else
      User.create(us)
      # create new user with username and user_id
      # create new oauth with uid and provier token user_id[User.id]
      @current user
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Signed Out"
  end
end
