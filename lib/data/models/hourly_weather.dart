import 'weather_data.dart';
import 'weather_data_with_temperature.dart';

class HourlyWeatherList {
  final List<WeatherDataWithTemperature> data;

  HourlyWeatherList(this.data);

  static const _hoursCount = 24;

  factory HourlyWeatherList.fromJson(Map<String, dynamic> json) {
    final timeList = json['time'] as List;
    final temperatureList = json['temperature_2m'] as List;
    final weatherCodeList = json['weathercode'] as List;

    final data = <WeatherDataWithTemperature>[];

    for (int index = 0; index < _hoursCount; index++) {
      final time = DateTime.parse(timeList[index]);
      final weatherStatus = WeatherData.weatherStatusfromDouble(
        weatherCodeList[index],
      );
      final temperature = temperatureList[index];

      data.add(
        WeatherDataWithTemperature(
          temperature: temperature,
          time: time,
          weatherStatus: weatherStatus,
        ),
      );
    }

    return HourlyWeatherList(data);
  }
}
