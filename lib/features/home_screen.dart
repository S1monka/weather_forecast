import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecast/core/ui/loading_widget.dart';
import 'package:weather_forecast/features/weather_forecast/bloc/weather_forecast_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Text('Irkutsk'),
        actions: [
          IconButton(
            onPressed: () {
              context
                  .read<WeatherForecastBloc>()
                  .add(const GetWeatherForecast());
            },
            icon: const Icon(Icons.map),
          ),
        ],
      ),
      body: BlocBuilder<WeatherForecastBloc, WeatherForecastState>(
        builder: (context, state) {
          if (state.status == Status.initial) {
            return const SizedBox();
          } else if (state.status == Status.loading) {
            return const LoadingWidget();
          } else if (state.status == Status.failure) {
            return const Center(
              child: Text('Что-то пошло не так'),
            );
          } else {
            final forecast = state.forecast!;
            return Center(
              child: RefreshIndicator(
                onRefresh: () async {
                  context
                      .read<WeatherForecastBloc>()
                      .add(const GetWeatherForecast());
                },
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        children: [
                          Text(forecast.currentWeather.formattedTemperature),
                          Icon(forecast.currentWeather.weatherStatus)
                        ],
                      ),
                      const SizedBox(height: 20),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: forecast.hourlyWeather.data
                              .map(
                                (hour) => Column(
                                  children: [
                                    Text(DateFormat.Hm().format(hour.time)),
                                    Icon(hour.weatherStatus),
                                    Text(hour.formattedTemperature),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      const Divider(),
                      const SizedBox(height: 20),
                      Column(
                        children: forecast.dailyWeather.data
                            .map(
                              (day) => ListTile(
                                leading:
                                    Text(DateFormat.MMMd().format(day.time)),
                                title: Icon(day.weatherStatus),
                                trailing: Text(
                                  '${day.minTemperature}/${day.formattedMaxTemperature}',
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
