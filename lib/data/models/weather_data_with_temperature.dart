import 'package:weather_forecast/core/utils/constants.dart';
import 'package:weather_forecast/data/models/weather_data.dart';
import 'package:weather_forecast/data/models/weather_status.dart';

class WeatherDataWithTemperature extends WeatherData {
  final int temperature;

  String get formattedTemperature => '$temperature$temperatureUnit';

  WeatherDataWithTemperature({
    required this.temperature,
    required super.time,
    required super.weatherStatus,
  });

  factory WeatherDataWithTemperature.fromJson(Map<String, dynamic> json) {
    final temperature = (json['temperature'] as double).toInt();
    final time = DateTime.parse(json['time']);

    final weatherStatus =
        WeatherStatus.fromData(weatherCode: json['weathercode'], time: time);

    return WeatherDataWithTemperature(
      temperature: temperature,
      time: time,
      weatherStatus: weatherStatus,
    );
  }
}
