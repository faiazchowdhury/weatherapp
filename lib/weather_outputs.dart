import 'dart:convert';

import 'package:geolocator/geolocator.dart';
//import 'package:location/location.dart';
import 'package:weather/weather.dart';
import 'package:http/http.dart' as http;
class weather_outputs{
  static var data;
  static List<Weather> datafor;
  static Weather w;
  WeatherFactory wf= new WeatherFactory("13d7d7159d46a3c13dd1563d57db1113");
  weather_outputs(){
    getCurrentLocation();
  }
  void getCurrentLocation() async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    /*var location = new Location();
    var lat,long;
    await location.getLocation().then((onValue){
      lat=onValue.latitude.toString(); long= onValue.longitude.toString();
    });*/
    w = await wf.currentWeatherByLocation(position.latitude, position.longitude);
    datafor =await wf.fiveDayForecastByLocation(position.latitude, position.longitude);
    var result= await http.get('https://api.openweathermap.org/data/2.5/onecall?lat=${position.latitude}&lon=${position.longitude}&units=metric&exclude=current,minutely,hourly,alerts&appid=13d7d7159d46a3c13dd1563d57db1113');
    data=json.decode(result.body);
  }
}