require 'date'
require 'httparty'

class RandomWeatherWizard
  def geocode_ip
    p "___________________"
    p @lat = rand_lat
    p @lng = rand_lng
  end

  def today_plus_year
    DateTime.now.next_year.to_time.to_i
  end

  def weather_code
    response = HTTParty.get(forecast_url)
    JSON.parse(response.body)
  end

  def get_weather
    geocode_ip
    weather_code
  end

  def rand_lat
   rand(-90.000000000...90.000000000)
  end

  def rand_lng
    rand(-180.000000000...180.000000000)
  end

  def location_finder
    response = HTTParty.get(location_url)
    JSON.parse(response.body)
  end

  private
  def google_url
    "https://www.googleapis.com/geolocation/v1/geolocate?key=#{ENV["GOOGLE_API_KEY"]}"
  end

  def forecast_url
    "https://api.forecast.io/forecast/#{ENV["FORECAST_API_KEY"]}/#{@lat},#{@lng},#{today_plus_year}"
  end

  def location_url
    "http://maps.googleapis.com/maps/api/geocode/json?latlng=#{@lat},#{@lng}"
  end
end
