import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:weather_forecast/data/models/weather_data_with_temperature.dart';
import 'package:weather_icons/weather_icons.dart';

class HourlyWeatherListWidget extends StatelessWidget {
  final List<WeatherDataWithTemperature> weatherList;
  const HourlyWeatherListWidget({
    Key? key,
    required this.weatherList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: weatherList.asMap().keys.map(
          (index) {
            final hour = weatherList[index];
            return Row(
              children: [
                Column(
                  children: [
                    Text(DateFormat.Hm().format(hour.time)),
                    BoxedIcon(hour.weatherStatus.icon),
                    Text(hour.formattedTemperature),
                  ],
                ),
                if (index != weatherList.length - 1) const SizedBox(width: 20),
              ],
            );
          },
        ).toList(),
      ),
    );
  }
}
