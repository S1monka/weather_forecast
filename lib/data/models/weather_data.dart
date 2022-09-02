import 'weather_status.dart';

abstract class WeatherData {
  final DateTime time;

  final WeatherStatus weatherStatus;

  WeatherData({
    required this.time,
    required this.weatherStatus,
  });
}
