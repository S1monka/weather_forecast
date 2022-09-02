import 'daily_weather.dart';
import 'hourly_weather.dart';
import 'weather_data_with_temperature.dart';

class Forecast {
  final WeatherDataWithTemperature currentWeather;
  final HourlyWeatherList hourlyWeather;
  final DailyWeatherList dailyWeather;

  final String timezone;

  Forecast(
    this.currentWeather,
    this.hourlyWeather,
    this.dailyWeather,
    this.timezone,
  );

  factory Forecast.fromJson(Map<String, dynamic> json) {
    final currentWeather =
        WeatherDataWithTemperature.fromJson(json['current_weather']);

    final hourlyWeatherList = HourlyWeatherList.fromJson(json['hourly']);

    final dailyWeatherList = DailyWeatherList.fromJson(json['daily']);

    final timezone = (json['timezone'] as String).split('/').join(', ');

    return Forecast(
      currentWeather,
      hourlyWeatherList,
      dailyWeatherList,
      timezone,
    );
  }
}
