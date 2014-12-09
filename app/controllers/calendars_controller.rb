class CalendarsController < ApplicationController
  def show
    @beginning_of_month = Date.civil(2012, 12, 1)
    @end_of_month = Date.civil(2012, 12, -1)
  end
end
