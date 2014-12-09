class HomeController < ApplicationController

  def index
    @current_user = User.new
    @beginning_of_month = Date.civil(2014, 12, 1)
    @end_of_month = Date.civil(2014, 12, -1)
  end

end
