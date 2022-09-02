import 'package:flutter/material.dart';

import 'package:weather_forecast/data/models/weather_data_with_temperature.dart';
import 'package:weather_icons/weather_icons.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final String timezone;
  final WeatherDataWithTemperature currentWeather;
  const CurrentWeatherWidget({
    Key? key,
    required this.timezone,
    required this.currentWeather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          timezone.toUpperCase(),
          style: Theme.of(context).textTheme.headline2,
        ),
        const SizedBox(height: 10),
        Text(
          currentWeather.weatherStatus.description.toUpperCase(),
          style: Theme.of(context).textTheme.headline3,
        ),
        BoxedIcon(
          currentWeather.weatherStatus.icon,
          size: 100,
        ),
        Text(
          currentWeather.formattedTemperature,
          style: Theme.of(context).textTheme.headline1,
        ),
      ],
    );
  }
}
