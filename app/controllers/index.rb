get '/' do
  wiz = WeatherWizard.new
  @temp =     wiz.get_weather["currently"]["temperature"]
  @precip =   wiz.get_weather["currently"]["precipType"]
  @humidity = wiz.get_weather["currently"]["humidity"]
  @wind =     wiz.get_weather["currently"]["windSpeed"]
  erb :'index'
end

