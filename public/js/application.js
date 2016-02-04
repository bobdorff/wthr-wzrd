$(document).ready(function() {
  var google = window.google_api_key;
  var location_request = $.ajax({
    url: "https://www.googleapis.com/geolocation/v1/geolocate?key="+google,
    method: "POST",
    body: {
      "consider_ip": true
    }
  });
  location_request.done(function(location){
    // console.log(location);
    // place holders below on the right
    var forcast = window.forcast_api_key;
    var latitude = "latitude.to_s";
    var longitude = "longitude.to_s";
    var time = "time.to_s";
    var forecast_request = $.ajax({
          url :"https://api.forecast.io/forecast/" + forcast + "/" + location + "," + location + "," + latitude + "," +longitude + "," + time,
          method: "POST"
    });
  });
});
