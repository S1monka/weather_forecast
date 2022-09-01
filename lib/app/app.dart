import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast/core/di/injection.dart';
import 'package:weather_forecast/features/home_screen.dart';
import 'package:weather_forecast/features/weather_forecast/bloc/weather_forecast_bloc.dart';

class WeatherForecastApp extends StatelessWidget {
  const WeatherForecastApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WeatherForecastBloc>(),
      child: MaterialApp(
        title: 'Flutter Demo',
        builder: BotToastInit(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
