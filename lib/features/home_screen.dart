import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/core/ui/loading_widget.dart';
import 'package:weather_forecast/features/weather_forecast/bloc/weather_forecast_bloc.dart';
import 'package:weather_forecast/features/weather_forecast/ui/current_weather_widget.dart';
import 'package:weather_forecast/features/weather_forecast/ui/daily_weather_list_widget.dart';

import 'weather_forecast/ui/hourly_weather_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherBloc = context.read<WeatherForecastBloc>();
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<WeatherForecastBloc, WeatherForecastState>(
          builder: (context, state) {
            if (state.status == Status.initial) {
              return const SizedBox();
            } else if (state.status == Status.loading) {
              return const LoadingWidget();
            } else if (state.status == Status.failure &&
                state.forecast == null) {
              return RefreshIndicator(
                color: Theme.of(context).textTheme.subtitle1!.color,
                onRefresh: () async {
                  weatherBloc.add(const GetWeatherForecast());
                },
                child: const CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      child: Center(
                        child: Text('Something went wrong'),
                      ),
                    )
                  ],
                ),
              );
            } else {
              final forecast = state.forecast!;
              return RefreshIndicator(
                color: Theme.of(context).textTheme.subtitle1!.color,
                onRefresh: () async {
                  weatherBloc.add(const GetWeatherForecast());
                },
                child: SizedBox.expand(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    child: Column(
                      children: [
                        CurrentWeatherWidget(
                          timezone: forecast.timezone,
                          currentWeather: forecast.currentWeather,
                        ),
                        const SizedBox(height: 20),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: HourlyWeatherListWidget(
                            weatherList: forecast.hourlyWeather.data,
                          ),
                        ),
                        const Divider(),
                        DailyWeatherListWidget(
                          dailyWeatherList: forecast.dailyWeather.data,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
