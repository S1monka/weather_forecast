import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_icons/weather_icons.dart';

import 'package:weather_forecast/data/models/daily_weather.dart';

class DailyWeatherListWidget extends StatelessWidget {
  final List<DailyWeather> dailyWeatherList;
  const DailyWeatherListWidget({
    Key? key,
    required this.dailyWeatherList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: dailyWeatherList
          .map(
            (day) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text(DateFormat.MMMEd().format(day.time))),
                  Expanded(child: BoxedIcon(day.weatherStatus.icon, size: 24)),
                  Expanded(
                    child: Text(
                      day.formatterDayTemperature,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
