import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model.dart';
class DataService{

  Future<WeatherResponse> getWeather(String city) async{
    //api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    final queryPramater = {
      'q': city ,
      'appid': 'd816167bbbc34305f7b99acec41fac08',
      "units": "metric"
    };

    final uri = Uri.https("api.openweathermap.org", "/data/2.5/weather", queryPramater);

    final response = await http.get(uri);

    final json = jsonDecode(response.body);

    return WeatherResponse.fromJson(json);
  }
}