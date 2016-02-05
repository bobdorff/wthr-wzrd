require "pp"

get '/' do
  wiz = WeatherWizard.new
  data = wiz.get_weather
  city = wiz.location_finder["results"][0]["formatted_address"]
  @city     = city
  @temp     = data["currently"]["temperature"]
  @precip   = data["currently"]["precipType"]
  @humidity = data["currently"]["humidity"]
  @wind     = data["currently"]["windSpeed"]
  erb :'index'
end

get '/random' do
  wiz = RandomWeatherWizard.new
  data = wiz.get_weather

  if data && data["flags"]["sources"] != []
    @city = wiz.location_finder["results"][0]["formatted_address"]
    @temp =     data["currently"]["temperature"]
    @precip =   data["currently"]["precipType"]
    @humidity = data["currently"]["humidity"]
    @wind =     data["currently"]["windSpeed"]
    erb :'_weather_table', layout: false, locals: {temp: @temp, precip: @precip, humidity: @humidity, wind: @wind, city:@city}
  else
    @city = "No data for this location"
    @temp =     "-"
    @precip =   "-"
    @humidity = "-"
    @wind =     "-"
    erb :'_weather_table', layout:false, locals: {temp: @temp, precip: @precip, humidity: @humidity, wind: @wind, city:@city}
  end
end
