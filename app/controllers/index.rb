get '/' do
  wiz = WeatherWizard.new
  data = wiz.get_weather
  @temp =     data["currently"]["temperature"]
  @precip =   data["currently"]["precipType"]
  @humidity = data["currently"]["humidity"]
  @wind =     data["currently"]["windSpeed"]
  erb :'index'
end

