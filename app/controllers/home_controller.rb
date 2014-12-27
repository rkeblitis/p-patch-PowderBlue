require "date"
class HomeController < ApplicationController

  def index
    @current_user = User.new

    # for the calendar
    @display_month_year = Date.today.strftime("%B %Y")
    @current_year = Date.today.strftime("%Y").to_i
    @current_month = Date.today.strftime("%m").to_i
    @beginning_of_month = Date.civil(@current_year, @current_month, 1)
    @end_of_month = Date.civil(@current_year, @current_month, -1)

    weather

  end

  def weather
    @api = HTTParty.get("http://api.openweathermap.org/data/2.5/find?q=Seattle&units=imperial")
    @api.parsed_response
    api_description = @api["list"][0]["weather"][0]["description"]
    first_letter = api_description[0].upcase
    rest_of_word = api_description[1..-1]
    cap_word = rest_of_word.gsub(/\s[a-z]/, &:upcase)
    @description = first_letter + cap_word
    forecast
    # forecast = HTTParty.get("http://api.openweathermap.org/data/2.5/forecast/daily?id=5809844").parsed_response
  end

  def forecast
    forecast = HTTParty.get("http://api.openweathermap.org/data/2.5/forecast/daily?id=5809844").parsed_response
    d = forecast["list"][0]["dt"]
    @forecast = Time.at(d)
    @day_temp = forecast["list"][0]["temp"]["day"]
    @night_temp = forecast["list"][0]["temp"]["night"]
    @morn_temp = forecast["list"][0]["temp"]["morn"]
    @press = forecast["list"][0]["pressure"]
    @hum = forecast["list"][0]["humidity"]
    @des = forecast["list"][0]["weather"][0]["description"]
  end


end
