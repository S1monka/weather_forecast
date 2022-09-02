import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

abstract class WeatherStatus {
  final IconData icon;
  final String description;

  const WeatherStatus(this.icon, this.description);

  factory WeatherStatus.fromData(
      {required double weatherCode, required DateTime time}) {
    final isNight = time.hour > 20 || time.hour < 6;
    switch (weatherCode.toInt().toString()) {
      case '0':
        return ClearSky(isNight);
      case "1":
      case "2":
      case "3":
        return const Cloudy();
      case '45':
      case '48':
        return const Fog();
      case '51':
      case '53':
      case '55':
      case '56':
      case '57':
        return const Drizzle();
      case '61':
      case '63':
      case '65':
      case "66":
      case '67':
        return const Rain();
      case '71':
      case '73':
      case '75':
      case '77':
      case '85':
      case '86':
        return const Snow();

      case '80':
      case '81':
      case '82':
        return const RainShowers();

      default:
        return ClearSky(isNight);
    }
  }
}

class ClearSky extends WeatherStatus {
  const ClearSky(bool isNight)
      : super(
          isNight ? WeatherIcons.night_clear : WeatherIcons.day_sunny,
          'Clear sky',
        );
}

class Cloudy extends WeatherStatus {
  const Cloudy()
      : super(
          WeatherIcons.cloudy,
          'Cloudy',
        );
}

class Fog extends WeatherStatus {
  const Fog()
      : super(
          WeatherIcons.fog,
          'Fog',
        );
}

class Drizzle extends WeatherStatus {
  const Drizzle()
      : super(
          WeatherIcons.sleet,
          'Drizzle',
        );
}

class Rain extends WeatherStatus {
  const Rain()
      : super(
          WeatherIcons.rain,
          "Rain",
        );
}

class Snow extends WeatherStatus {
  const Snow()
      : super(
          WeatherIcons.snow,
          'Snow',
        );
}

class RainShowers extends WeatherStatus {
  const RainShowers()
      : super(
          WeatherIcons.showers,
          'Rain showers',
        );
}
