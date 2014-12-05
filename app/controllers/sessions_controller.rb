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
    if Oauth.find_by(uid: auth_hash["uid"])
      @oauth = Oauth.find_by(uid: auth_hash["uid"])
      @current_user = session[@oauth.user_id]
      @user = User.find(@oauth.user_id)
      redirect_to root_path, notice: "You're signed in, #{@user.username} Yay!"
    else
      @user = User.create(username: auth_hash["info"]["nickname"], password_digest: "nil", email: "nil")
      Oauth.create(user_id: @user.id, uid: auth_hash["uid"], provider: auth_hash["provider"], token: auth_hash["credentials"]["token"])
      @current_user = session[@user.id]
      redirect_to root_path, notice: "You're signed in, #{@user.username} Yay!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Signed Out"
  end
end
