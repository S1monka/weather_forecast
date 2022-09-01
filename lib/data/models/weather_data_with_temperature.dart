import 'package:weather_forecast/core/utils/constants.dart';
import 'package:weather_forecast/data/models/weather_data.dart';

class WeatherDataWithTemperature extends WeatherData {
  final double temperature;

  String get formattedTemperature => '$temperature$temperatureUnit';

  WeatherDataWithTemperature({
    required this.temperature,
    required super.time,
    required super.weatherStatus,
  });

  factory WeatherDataWithTemperature.fromJson(Map<String, dynamic> json) {
    final temperature = json['temperature'];
    final time = DateTime.parse(json['time']);

    final weatherStatus =
        WeatherData.weatherStatusfromDouble(json['weathercode']);

    return WeatherDataWithTemperature(
      temperature: temperature,
      time: time,
      weatherStatus: weatherStatus,
    );
  }
}
