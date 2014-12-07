class HomeController < ApplicationController

  def index
    @current_user = User.new
  end

end
