class HomeController < ApplicationController

  def index
    @current_user = User.new

    # for the calendar
    @display_month_year = Date.today.strftime("%B %Y")
    @current_year = Date.today.strftime("%Y").to_i
    @current_month = Date.today.strftime("%m").to_i
    @beginning_of_month = Date.civil(@current_year, @current_month, 1)
    @end_of_month = Date.civil(@current_year, @current_month, -1)

    daily_weather

  end

  def daily_weather
    @api = HTTParty.get("http://api.openweathermap.org/data/2.5/find?q=Seattle&units=imperial")
    @api.parsed_response
    @description = @api["list"][0]["weather"][0]["description"]
    forecast_day
  end

  def forecast_day
    forecast = HTTParty.get("http://api.openweathermap.org/data/2.5/forecast/daily?id=5809844").parsed_response
    @forecast = forecast["list"]
  end
end
