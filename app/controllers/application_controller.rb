class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  # helper_method :logged_in?

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end


    # if User.find(params[:id])
    #   @current_user = session[:user_id]
    # else
    #   @current_user
    # end
  end

  # def logged_in?
  #   if @current_user != nil
  #     true
  #   else
  #     false
  #   end
  # end

end
