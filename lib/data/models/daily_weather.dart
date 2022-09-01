import 'package:weather_forecast/core/utils/constants.dart';

import 'weather_data.dart';

class DailyWeather extends WeatherData {
  final double maxTemperature;
  final double minTemperature;

  String get formattedMaxTemperature => '$maxTemperature$temperatureUnit';
  String get formattedMinTemperature => '$minTemperature$temperatureUnit';

  DailyWeather({
    required super.time,
    required super.weatherStatus,
    required this.maxTemperature,
    required this.minTemperature,
  });
}

class DailyWeatherList {
  final List<DailyWeather> data;

  DailyWeatherList(this.data);

  //max is 7
  static const _daysCount = 7;

  factory DailyWeatherList.fromJson(Map<String, dynamic> json) {
    final timeList = json['time'] as List;
    final maxTemperatureList = json['temperature_2m_max'] as List;
    final minTemperatureList = json['temperature_2m_min'] as List;
    final weatherCodeList = json['weathercode'] as List;

    final data = <DailyWeather>[];

    for (int index = 0; index < _daysCount; index++) {
      final time = DateTime.parse(timeList[index]);
      final weatherStatus = WeatherData.weatherStatusfromDouble(
        weatherCodeList[index],
      );
      final maxTemperature = maxTemperatureList[index];
      final minTemperature = minTemperatureList[index];

      data.add(
        DailyWeather(
          maxTemperature: maxTemperature,
          minTemperature: minTemperature,
          time: time,
          weatherStatus: weatherStatus,
        ),
      );
    }

    return DailyWeatherList(data);
  }
}
