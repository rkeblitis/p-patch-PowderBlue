class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    if User.find(params[:id])
      @current_user = session[:user_id]
    else
      @current_user 
    end
  end
end
