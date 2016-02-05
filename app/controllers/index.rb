get '/' do
  wiz = WeatherWizard.new
  data = wiz.get_weather
  @temp =     data["currently"]["temperature"]
  @precip =   data["currently"]["precipType"]
  @humidity = data["currently"]["humidity"]
  @wind =     data["currently"]["windSpeed"]
  erb :'index'
end

get '/random' do
  wiz =WeatherWizard.new
  data = wiz.rand_weather
  @temp =     data["currently"]["temperature"]
  @precip =   data["currently"]["precipType"]
  @humidity = data["currently"]["humidity"]
  @wind =     data["currently"]["windSpeed"]
  erb :'_weather_table.erb', layout: false, locals: {temp: @temp, precip: @precip, humidity: @humidity, wind: @wind}
end
