/*
{
  "weather": [
    {
      "description": "clear sky",
      "icon": "01d"
    }
  ],
  "main": {
    "temp": 282.55,
    "feels_like": 281.86,
    "temp_min": 280.37,
    "temp_max": 284.26,
    "pressure": 1023,
    "humidity": 100
  },

  "name": "Mountain View",
  }
 */

import 'package:flutter/material.dart';

class WeatheInfo{
  final String description;
  final String icon;

  WeatheInfo({required this.description, required this.icon});

  factory WeatheInfo.fromJson(Map<String, dynamic> json){
    final description = json['description'];
    final icon = json['icon'];
    return WeatheInfo(description: description, icon: icon);
  }
}

class TempretureInfo{
  final double tempreture;

  TempretureInfo({required this.tempreture});

  factory TempretureInfo.fromJson(Map<String, dynamic> json){
    final tempreture = json["temp"];
    return TempretureInfo(tempreture: tempreture);
  }
}

class WeatherResponse{
  final String cityName;
  final TempretureInfo tempInfo;
  final WeatheInfo weatherInfo;

  String get imageURL{
    return "https://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png";
  }

  WeatherResponse({required this.cityName, required this.tempInfo, required this.weatherInfo});

  factory WeatherResponse.fromJson(Map<String, dynamic> json){
    final cityName = json["name"];

    final tempInfoJson = json["main"];
    final tempInfo = TempretureInfo.fromJson(tempInfoJson);

    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatheInfo.fromJson(weatherInfoJson);

    return WeatherResponse(cityName: cityName, tempInfo: tempInfo, weatherInfo: weatherInfo);
  }
}