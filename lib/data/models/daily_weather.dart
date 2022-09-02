import 'package:weather_forecast/core/utils/constants.dart';

import 'weather_data.dart';
import 'weather_status.dart';

class DailyWeather extends WeatherData {
  final int maxTemperature;
  final int minTemperature;

  String get formatterDayTemperature =>
      '$minTemperature\u00B0/$maxTemperature$temperatureUnit';

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
      final weatherStatus = WeatherStatus.fromData(
        weatherCode: weatherCodeList[index],
        time: time,
      );
      final maxTemperature = (maxTemperatureList[index] as double).toInt();
      final minTemperature = (minTemperatureList[index] as double).toInt();

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
