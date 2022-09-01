import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

abstract class WeatherData {
  final DateTime time;

  final IconData weatherStatus;

  WeatherData({
    required this.time,
    required this.weatherStatus,
  });

  static IconData weatherStatusfromDouble(double weatherCode) {
    switch (weatherCode.toString()) {
      case '0':
        return WeatherIcons.day_sunny;
      case "1":
      case "2":
      case "3":
        return WeatherIcons.cloudy;
      case '45':
      case '48':
        return WeatherIcons.fog;
      case '51':
      case '53':
      case '55':
      case '56':
      case '57':
        return WeatherIcons.sleet;
      case '61':
      case '63':
      case '65':
      case "66":
      case '67':
        return WeatherIcons.rain;
      case '71':
      case '73':
      case '75':
      case '77':
      case '85':
      case '86':
        return WeatherIcons.snow;

      case '80':
      case '81':
      case '82':
        return WeatherIcons.showers;

      default:
        return WeatherIcons.day_sunny;
    }
  }
}
