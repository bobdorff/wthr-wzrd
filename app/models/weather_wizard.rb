require 'date'
require 'httparty'

class WeatherWizard
  def geocode_ip
    response = HTTParty.post(google_url,
      body:    { "consider_ip" => true }.to_json,
      headers: { 'Content-Type' => 'application/json' })

    parsed_response = JSON.parse(response.body)
    @lat = parsed_response['location']['lat']
    @lng = parsed_response['location']['lng']
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

  private
  def google_url
    "https://www.googleapis.com/geolocation/v1/geolocate?key=#{ENV["GOOGLE_API_KEY"]}"
  end

  def forecast_url
    "https://api.forecast.io/forecast/#{ENV["FORCAST_API_KEY"]}/#{@lat},#{@lng},#{today_plus_year}"
  end

end
