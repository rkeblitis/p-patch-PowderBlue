module HomeHelper

  def kelvin_to_fahrenheit(k)
    f = 9/5 * (k - 273) + 32

  end

  def cap(weather_description)
    first_letter = weather_description[0].upcase
    rest_of_word = weather_description[1..-1]
    cap_word = rest_of_word.gsub(/\s[a-z]/, &:upcase)
    weather_description = first_letter + cap_word
  end
end
